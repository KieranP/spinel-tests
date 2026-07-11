# frozen_string_literal: true
# UncaughtThrowError#message
e001 = (throw :zz, 3 rescue $!); p e001.message
m002 = (throw :zz, 3 rescue $!).message; p m002

# a throw with no value: the message still names the tag
e003 = (throw :bare rescue $!); p e003.message

# message and to_s agree
e004 = (throw :q, 1 rescue $!); p(e004.message == e004.to_s)

# catch-wrapped uncaught throw carries the tag into the message
r005 = (begin; catch(:a) { throw :b }; rescue => e005; e005.message; end); p r005

# reading #message off an uncaught throw via a begin/rescue block aborts compilation
p(begin; throw :nope, 42; rescue => e006; e006.message; end)
