# frozen_string_literal: true
# StopIteration#frozen? (Object#frozen? on an exception instance)
# frozen? on an exception instance aborts compilation, so both forms are kept
# commented until fixed. Ruby: a fresh exception is not frozen -> false.
se001 = StopIteration.new("m"); p se001.frozen?
c002 = StopIteration.new("m").frozen?; p c002

# Placeholder so the file is valid Ruby and runs under both interpreters.
p(StopIteration.new("m").message)
