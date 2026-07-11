# frozen_string_literal: true

require_relative 'test_helper'

# Every case here is a line that was once classified wrongly, and each wrong answer showed
# up as a corrupted test file or a report that read as clean on a line that still failed.
class ClassifierTest < Minitest::Test
  Classifier = SpinelCheck::Source::Classifier

  def assert_code(line) = assert(Classifier.code?(line), "expected CODE: #{line.inspect}")
  def refute_code(line) = refute(Classifier.code?(line), "expected PROSE: #{line.inspect}")

  def test_probe_lines
    ['p x', 'p(1)', 'pp foo', 'puts "hi"', 'print 1'].each { |line| assert_code(line) }
  end

  def test_statement_keywords
    ['begin', 'rescue => e', 'end', 'def foo', 'class Foo', 'module M', 'require "set"',
     'raise ArgumentError', 'include Comparable', 'loop do'].each { |line| assert_code(line) }
  end

  # An unanchored /\brescue\b/ once uncommented this sentence as if it were code.
  def test_prose_mentioning_keywords_is_not_code
    refute_code("a rescue can't catch a compile error")
    refute_code('the module is rejected before any C is emitted')
  end

  # `\b` after the keyword was too weak: prose that joins a keyword to the next word with
  # punctuation read as a statement. This one is real — it sat in a filed report and broke
  # that report's activation, degrading its verify to the as-is fallback.
  def test_prose_that_joins_a_keyword_with_punctuation_is_not_code
    refute_code('raise/rescue at all, compile clean.')
    refute_code('class-name array pattern (dispatches to #deconstruct)')
    refute_code('rescue-clause matching against a built-in Exception class works')
    refute_code("loop's value: `break VALUE`, and the enumerator's StopIteration")
    refute_code('include? nil (poly array)')
  end

  # ...but punctuation that genuinely follows a keyword in code must still read as code.
  # `end); p r009` is the tail of a multi-line `r009 = (begin … end); p r009` form; treating
  # it as prose would leave it commented and silently break the form.
  def test_punctuation_that_legally_follows_a_keyword_is_still_code
    assert_code('end); p r009')
    assert_code('end.sum')
    assert_code('raise ArgumentError,')
    assert_code('end;')
    assert_code('end')
  end

  # `attr :x` without a suffix is real code; leaving it commented left an activated reader
  # undefined, i.e. a false NoMethodError.
  def test_bare_attr
    assert_code('attr :x')
    assert_code('attr_reader :y')
  end

  def test_assignment_forms
    ['x = 1', 'x ||= 2', 'a[i] = 3', '@x = 4', '@@z = 5', 'CONST = 6',
     'x += 1', 'x <<= 2'].each { |line| assert_code(line) }
  end

  def test_comparison_is_not_assignment
    refute_code('x == 1')
    refute_code('x =~ /re/')
  end

  # Left commented, this stranded a dependent `p [a, b]` on an undefined local — parseable
  # Ruby that fails at runtime, which a syntax check cannot catch.
  def test_multiple_assignment
    ['a, b = 1, 2', 'k, v = pair', 'a, *rest = list', 'x, y[i] = 1, 2'].each { |line| assert_code(line) }
  end

  # The gap that silently dropped `tbl.each { |a, b| out += b }`.
  def test_bare_method_calls
    ['tbl.each { |a, b| out += b }', 'Foo::bar', 'foo(1)', 'arr << x',
     'obj.each do |i|'].each { |line| assert_code(line) }
  end

  # `foo(x)` is a call; `rejected ("unsupported …")` — word, space, paren — is prose, and
  # was being uncommented into a bogus CallNode.
  def test_paren_must_follow_the_receiver_directly
    assert_code('foo(x)')
    refute_code('rejected ("unsupported feature")')
  end

  # Every other pattern needs a NAME first, so these were never recognised — meaning verify
  # and activate left them commented and the report read as clean on a failing line.
  def test_literal_receivers
    ['[[1, 2]].each { |a| p a }', '"ab".chars', '1.upto(3) { |i| p i }',
     '{a: 1}.fetch(:a)', '(1..3).to_a', '%w[a b].map(&:upcase)'].each { |line| assert_code(line) }
  end

  def test_literal_looking_prose_is_not_code
    refute_code('"foo" is printed by ruby, but not by spinel.')
    refute_code('[1, 2] and the rest,')
  end

  # A method whose body ends in the literal it returns had that line judged prose, so
  # activation left it commented and the method silently returned something else.
  def test_bare_container_literal_is_code
    assert_code('[{}, layout, 0]')
    assert_code('  [1, 2, 3]')
    assert_code('{ a: 1, b: 2 }')
  end

  # The shape alone is not enough: bracketed prose matches the regex but is not a literal.
  def test_bracketed_prose_is_not_code
    refute_code('[section] \u2014 [sub-section]')
    refute_code('[a b c]')
  end

  def test_print_predicate_distinguishes_probes_from_setup
    assert Classifier.print?('p x')
    assert Classifier.print?('puts y')
    refute Classifier.print?('x = 1')
    refute Classifier.print?('EVEN = ->(n) { n.even? }')
  end

  # The body of a commented-out lambda-returning method read as prose, so activation
  # uncommented the `def` and `end` around it and left an empty method behind.
  def test_a_lambda_literal_opening_the_line_is_code
    assert Classifier.code?('->(step) { ->(acc, input) { step.call(acc, input) } }')
    assert Classifier.code?('-> { 1 }')
    assert Classifier.code?('lambda do |step|')
    assert Classifier.code?('proc { |x| x }')
  end

  def test_prose_merely_mentioning_a_lambda_is_not_code
    refute Classifier.code?('the lambda returns another lambda, which is the point.')
    refute Classifier.code?('a proc and a lambda differ in how they handle return.')
  end
end
