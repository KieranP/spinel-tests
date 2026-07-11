# frozen_string_literal: true
# UncaughtThrowError#frozen? (Object#frozen? on an exception instance)
# frozen? on an exception instance aborts compilation, so both forms are kept
# commented until fixed. Ruby: a freshly raised exception is not frozen -> false.
e001 = (throw :x rescue $!); p e001.frozen?
c002 = (throw :x rescue $!).frozen?; p c002

# Placeholder so the file is valid Ruby and runs under both interpreters.
e003 = (throw :x rescue $!); p e003.message
