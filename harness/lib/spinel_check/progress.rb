# frozen_string_literal: true

require 'ruby-progressbar'

module SpinelCheck
  # Live progress for every sweep.
  #
  # Every command here collects all of its results before printing any of them — a sweep of
  # ~1000 files, each a full C compile, is otherwise minutes of total silence that reads as
  # a hang. So each one shows a bar, and they all go through Progress.track.
  #
  # It writes to STDERR, so it never lands in the stdout listing a caller is diffing or
  # grepping, and it is switched off entirely when stderr is not a tty, so piped logs stay
  # clean.
  class Progress
    FORMAT = '%c/%C %b%i %p%% %t'

    # A no-op with the same shape, so callers never branch on whether progress is on.
    class Silent
      def advance(_label = nil) = nil
      def finish = nil
    end

    # Runs a block with a bar, and always closes it — a bar left unfinished by an exception
    # leaves the terminal holding a half-drawn line.
    def self.track(total, label: nil, io: $stderr)
      bar = self.for(total, label: label, io: io)
      yield bar
    ensure
      bar&.finish
    end

    def self.for(total, label: nil, io: $stderr)
      io.tty? ? new(total, label, io) : Silent.new
    end

    def initialize(total, label, io)
      @bar = ProgressBar.create(
        total: total,
        output: io,
        title: '',
        format: label ? "#{label} #{FORMAT}" : FORMAT,
        remainder_mark: '·',
        length: 100
      )
      @mutex = Mutex.new
    end

    # `label` becomes the trailing title, so the item in flight is visible.
    def advance(label = nil)
      @mutex.synchronize do
        @bar.title = label.to_s if label
        @bar.increment
      end
    end

    def finish = @mutex.synchronize { @bar.stop }
  end
end
