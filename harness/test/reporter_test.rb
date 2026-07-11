# frozen_string_literal: true

require 'stringio'

require_relative 'test_helper'

class ReporterTest < Minitest::Test
  # A sink that claims to be a terminal, to prove colour follows the STREAM rather than
  # global state keyed off $stdout.
  class Terminal < StringIO
    def tty? = true
  end

  def config(env = {}) = SpinelCheck::Config.from_env('/repo', env: env)

  def reporter(io) = SpinelCheck::Reporter.new(config: config, io: io)

  def test_no_colour_when_the_sink_is_not_a_terminal
    io = StringIO.new
    reporter(io).puts(reporter(io).status('DIFF', width: 9))
    refute_includes io.string, "\e["
  end

  def test_colour_when_the_sink_is_a_terminal
    io = Terminal.new
    io.puts(reporter(io).status('DIFF', width: 9))
    assert_includes io.string, "\e[31m"
  end

  # Escape sequences count toward String#length, so padding must happen before colouring.
  def test_padding_is_applied_before_colour
    plain = SpinelCheck::Style.new(StringIO.new).status('DIFF', width: 9)
    assert_equal 'DIFF     ', plain
    coloured = SpinelCheck::Style.new(Terminal.new).status('DIFF', width: 9)
    assert_includes coloured, 'DIFF     '
  end

  # 'DIFF+CERR' is one thing, coloured by its leading segment.
  def test_compound_tokens_are_coloured_as_one
    assert_equal "\e[31mDIFF+CERR\e[0m", SpinelCheck::Style.new(Terminal.new).status('DIFF+CERR')
  end

  def test_unknown_tokens_pass_through_uncoloured
    assert_equal 'MYSTERY', SpinelCheck::Style.new(Terminal.new).status('MYSTERY')
  end

  # A caveat qualifies a verdict, so it belongs on stdout beside its row — on stderr the
  # progress bar's carriage returns smear it.
  def test_caveats_go_to_the_output_stream
    io = StringIO.new
    reporter(io).caveat('activation yielded unparseable Ruby', '  ')
    assert_equal "  ⚠ activation yielded unparseable Ruby\n", io.string
  end

  def test_summary_keeps_zeroes_but_drops_inapplicable_counts
    io = StringIO.new
    reporter(io).summary('78 reports', 'MATCH' => 39, 'CERR' => 0, 'MEMORY' => nil)
    assert_equal "\n78 reports  |  39 MATCH  |  0 CERR\n", io.string
  end

  # A repro that dumps something huge on one line must not flood the terminal.
  def test_diff_output_is_capped
    io = StringIO.new
    ruby   = SpinelCheck::Runner::Result.new(stdout: (1..50).map { |i| "#{i}\n" }.join,
                                            stderr: '', peak_mb: 0, outcome: :ok)
    spinel = SpinelCheck::Runner::Result.new(stdout: 'x' * 500, stderr: '', peak_mb: 0, outcome: :ok)
    reporter(io).diff(SpinelCheck::Comparison.new(path: 'f', ruby: ruby, spinel: spinel), '')
    assert_operator io.string.lines.size, :<=, SpinelCheck::Reporter::MAX_DIFF_LINES
    io.string.lines.each { |line| assert_operator line.chomp.length, :<=, SpinelCheck::Reporter::MAX_COLUMNS }
  end
end
