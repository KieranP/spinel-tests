# frozen_string_literal: true
# SignalException#frozen? (Object#frozen? on an exception instance)
# frozen? on an exception instance aborts compilation, so both forms are kept
# commented until fixed. Ruby: a fresh SignalException is not frozen -> false.
fi001 = SignalException.new("INT"); p fi001.frozen?
c002 = SignalException.new("INT").frozen?; p c002
