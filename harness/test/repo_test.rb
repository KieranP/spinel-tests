# frozen_string_literal: true

require 'tmpdir'

require_relative 'test_helper'

class RepoTest < Minitest::Test
  Repo = SpinelCheck::Repo

  def test_id_for_timestamp_stem
    assert_equal '20260811200244609', Repo.id_for('bugs/20260811200244609_exception_new.rb')
  end

  # Older reports use short sequential stems.
  def test_id_for_legacy_stem
    assert_equal '7', Repo.id_for('bugs/7_some_slug.rb')
  end

  def test_id_for_stem_without_an_underscore
    assert_equal 'oddity', Repo.id_for('bugs/oddity.rb')
  end

  # A typo used to pass straight through to the toolchains, where a missing file makes BOTH
  # sides print nothing to stdout — so it "matched" and reported as a pass.
  def test_expand_rejects_a_path_that_does_not_exist
    error = assert_raises(SpinelCheck::Error) { Repo.expand(['bugs/nope.rb'], default: 'bugs') }
    assert_match(/no such file or directory: bugs\/nope\.rb/, error.message)
  end

  def test_expand_collects_rb_files_under_a_directory
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, 'b.rb'), '')
      File.write(File.join(dir, 'a.rb'), '')
      File.write(File.join(dir, 'skip.txt'), '')
      Dir.mkdir(File.join(dir, 'nested'))
      File.write(File.join(dir, 'nested', 'c.rb'), '')

      assert_equal %w[a.rb b.rb nested/c.rb].map { |f| File.join(dir, f) },
                   Repo.expand([dir], default: 'unused')
    end
  end

  def test_expand_falls_back_to_the_default
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, 'a.rb'), '')
      assert_equal [File.join(dir, 'a.rb')], Repo.expand([], default: dir)
    end
  end

  # The index is shared across every worker thread, so a read of an unknown id must not be
  # able to mutate it.
  def test_tag_index_is_frozen_and_has_no_default_proc
    index = Repo.tag_index
    assert index.frozen?, 'tag index should be frozen'
    assert_nil index.default_proc
    assert_empty Repo.test_files_for('99999999999999999')
    assert_raises(FrozenError) { index['x'] = [] }
  end
end
