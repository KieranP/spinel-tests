# frozen_string_literal: true

module SpinelCheck
  # A problem with what was asked for, not a bug in the harness. The CLI turns these into a
  # one-line message and a non-zero exit, with no backtrace.
  class Error < StandardError; end
end
