# frozen_string_literal: true

require 'set'

require_relative 'test_helper'

class ActivationTest < Minitest::Test
  Activation = SpinelCheck::Source::Activation

  def activate(text, *ids) = Activation.for_ids(text.lines, ids.to_set).join

  def test_inline_tagged_live_line_is_untagged
    assert_equal "p 1\n", activate("p 1  # BUG 42 - wrong value\n", '42')
  end

  def test_inline_tagged_commented_line_is_uncommented_and_untagged
    assert_equal "p 1\n", activate("# p 1  # BUG 42 - compile abort\n", '42')
  end

  def test_other_reports_lines_are_untouched
    source = "# p 1  # BUG 42 - x\n# p 2  # BUG 99 - y\n"
    assert_equal "p 1\n# p 2  # BUG 99 - y\n", activate(source, '42')
  end

  # An id must not match a longer one that merely starts with it.
  def test_id_matching_does_not_match_a_prefix
    assert_equal "# p 1  # BUG 421 - x\n", activate("# p 1  # BUG 421 - x\n", '42')
  end

  def test_section_header_is_dropped_and_its_code_uncommented
    source = <<~RUBY
      # BUG 42 - compile abort
      # x = 1
      # p x

      p 'after'
    RUBY
    assert_equal "x = 1\np x\n\np 'after'\n", activate(source, '42')
  end

  # A code line the classifier does not recognise must survive as a comment, never vanish.
  def test_section_prose_is_kept_as_a_comment
    source = "# BUG 42 - cause\n# spinel rejects this before emitting C\n# p 1\n"
    assert_equal "# spinel rejects this before emitting C\np 1\n", activate(source, '42')
  end

  def test_section_block_stops_at_another_reports_header
    source = "# BUG 42 - a\n# p 1\n# BUG 99 - b\n# p 2\n"
    assert_equal "p 1\n# BUG 99 - b\n# p 2\n", activate(source, '42')
  end

  # Activating `select(&EVEN045)` while `EVEN045 = ->(x) { … }` stayed commented left the
  # file raising NameError under BOTH toolchains — so it "matched" only because both sides
  # were equally broken.
  def test_fixture_on_a_preceding_commented_line_is_backfilled
    source = "# EVEN045 = ->(x) { x.even? }\n# p [1, 2].select(&EVEN045)  # BUG 42 - x\n"
    assert_equal "EVEN045 = ->(x) { x.even? }\np [1, 2].select(&EVEN045)\n", activate(source, '42')
  end

  # A sibling probe is not a dependency; activating it would silently widen the change.
  def test_backfill_stops_at_a_preceding_print
    source = "# p 'sibling'\n# p 2  # BUG 42 - x\n"
    assert_equal "# p 'sibling'\np 2\n", activate(source, '42')
  end

  def test_neutralize_comments_out_live_tagged_lines_only
    source = ["p 1  # BUG 42 - x\n", "# p 2  # BUG 42 - y\n", "p 3\n"]
    assert_equal ["# p 1  # BUG 42 - x\n", "# p 2  # BUG 42 - y\n", "p 3\n"],
                 Activation.neutralize(source, '42')
  end

  def test_uncomment_all_activates_every_code_line_but_not_bug_headers
    source = "# BUG 42 - cause\n# p 1\n# just prose here.\np 2\n"
    assert_equal "# BUG 42 - cause\np 1\n# just prose here.\np 2\n",
                 Activation.uncomment_all(source.lines).join
  end

  # An empty `class Box; end` whose `#   attr_reader` / `#   def join` members stayed
  # commented parses fine, so nothing caught it — the calls then bound to the builtin of
  # the same name and the form reported a divergence Spinel had nothing to do with.
  def test_uncomment_all_activates_indented_members_of_a_commented_class
    source = <<~RUBY
      # class Box
      #   attr_reader :value
      #
      #   def join(other) = Box.new(@value + other.value)
      # end
    RUBY
    expected = <<~RUBY
      class Box
        attr_reader :value
      #
        def join(other) = Box.new(@value + other.value)
      end
    RUBY
    assert_equal expected, Activation.uncomment_all(source.lines).join
  end

  # A run, not a line: uncommenting one line of a multi-line `class … end` either fails to
  # parse or leaves the definition commented while activating the call — so both toolchains
  # fail identically and the form reads as falsely clean.
  def test_comment_runs_groups_consecutive_lines
    lines = <<~RUBY.lines
      p 'live'
      # class Foo
      #   def bar = 1
      # end
      # p Foo.new.bar

      # p 'separate run'
    RUBY
    assert_equal [[1, 2, 3, 4], [6]], Activation.comment_runs(lines)
  end

  def test_comment_runs_ignores_prose_only_runs
    lines = "# just a note about the bug.\np 1\n".lines
    assert_empty Activation.comment_runs(lines)
  end

  def test_comment_runs_excludes_bug_headers
    lines = "# BUG 42 - cause\n# p 1\n".lines
    assert_equal [[1]], Activation.comment_runs(lines)
  end

  def test_activate_run_leaves_the_rest_of_the_file_in_place
    lines = "require 'set'\n# p 1\n# p 2\n".lines
    assert_equal "require 'set'\np 1\n# p 2\n", Activation.activate_run(lines, [1]).join
  end
end
