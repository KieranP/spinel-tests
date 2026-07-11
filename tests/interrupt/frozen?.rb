# frozen_string_literal: true
# Interrupt#frozen? (Object#frozen? on an exception instance)
# frozen? on an exception instance aborts compilation, so both forms are kept
# commented until fixed. Ruby: a fresh Interrupt is not frozen -> false.
fi001 = Interrupt.new("m"); p fi001.frozen?
c002 = Interrupt.new("m").frozen?; p c002
