# frozen_string_literal: true
# UncaughtThrowError#to_s
e001 = (throw :zz, 3 rescue $!); p e001.to_s
s002 = (throw :zz, 3 rescue $!).to_s; p s002

# a throw with no value: to_s still names the tag
e003 = (throw :bare rescue $!); p e003.to_s

# catch-wrapped uncaught throw
r004 = (begin; catch(:a) { throw :b, 1 }; rescue => e004; e004.to_s; end); p r004
