# frozen_string_literal: true
# FrozenError#frozen? (Object#frozen? on an exception instance)
# frozen? on an exception instance aborts compilation, so both forms are kept
# commented until fixed. Ruby: a fresh exception is not frozen -> false.
fe001 = FrozenError.new("m"); p fe001.frozen?
c002 = FrozenError.new("m").frozen?; p c002
