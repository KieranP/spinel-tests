# frozen_string_literal: true
# KeyError#frozen? (Object#frozen? on an exception instance)
# frozen? on an exception instance aborts compilation, so both forms are kept
# commented until fixed. Ruby: a fresh exception is not frozen -> false.
ke001 = KeyError.new("m"); p ke001.frozen?
c002 = KeyError.new("m").frozen?; p c002

# Placeholder so the file is valid Ruby and runs under both interpreters.
p(KeyError.new("m").message)
