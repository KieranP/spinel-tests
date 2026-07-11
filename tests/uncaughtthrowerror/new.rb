# frozen_string_literal: true
# UncaughtThrowError.new
# UncaughtThrowError#initialize requires 2+ arguments (tag, value); constructing with
# too few raises ArgumentError in Ruby.
r001 = (UncaughtThrowError.new(:t) rescue $!.class); p r001
r002 = (UncaughtThrowError.new rescue $!.class); p r002

# The natural way to obtain one is an uncaught throw.
e003 = (throw :x, 5 rescue $!); p e003.class
c004 = (throw :x, 5 rescue $!).class; p c004
