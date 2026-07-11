# frozen_string_literal: true
# SystemExit#frozen? (Object#frozen? on an exception instance)
# frozen? on an exception instance is rejected at compile time, so both forms are
# kept commented until fixed. Ruby: a fresh exception is not frozen -> false.
fe001 = SystemExit.new(2); p fe001.frozen?
c002 = SystemExit.new(2).frozen?; p c002

# Placeholder so the file is valid Ruby and runs under both interpreters.
p(SystemExit.new(2).message)
