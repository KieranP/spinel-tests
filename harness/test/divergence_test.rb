# frozen_string_literal: true

require_relative 'test_helper'

class DivergenceTest < Minitest::Test
  Divergence = SpinelCheck::Divergence

  def test_identical_output_has_no_diff
    assert_empty Divergence.text("a\n", "a\n")
    assert_empty Divergence.changes("a\n", "a\n")
  end

  def test_text_is_classic_diff_format
    assert_equal "2c2\n< two\n---\n> TWO\n", Divergence.text("one\ntwo\n", "one\nTWO\n")
  end

  def test_text_covers_added_and_removed_lines
    assert_equal "2d1\n< b\n", Divergence.text("a\nb\n", "a\n")
    assert_equal "1a2\n> b\n", Divergence.text("a\n", "a\nb\n")
  end

  # Non-UTF-8 bytes reach here from a C-compiler diagnostic echoing a foreign-encoded
  # snippet; scanning them used to raise and take the whole run down.
  def test_text_survives_invalid_bytes
    assert_kind_of String, Divergence.text("a\n", "\xC3\x28\n")
  end

  def test_changes_records_direction_and_content
    assert_equal [['-', "two\n"], ['+', "TWO\n"]], Divergence.changes("one\ntwo\n", "one\nTWO\n")
  end

  # The point of `changes`: it must NOT shift when unrelated lines move the divergence
  # elsewhere in the file, so verify can tell "this report introduced it" from "it was
  # already there".
  def test_changes_are_stable_under_unrelated_line_shifts
    before = Divergence.changes("x\n", "y\n")
    after  = Divergence.changes("pad\npad\nx\n", "pad\npad\ny\n")
    assert_equal before, after
    refute_equal Divergence.text("x\n", "y\n"), Divergence.text("pad\npad\nx\n", "pad\npad\ny\n")
  end
end
