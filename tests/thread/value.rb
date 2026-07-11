# frozen_string_literal: true
# Thread#value
p Thread.new { 3 * 14 }.value
t001 = Thread.new { "hi".upcase }
v001 = t001.value
p v001
r001 = (Thread.new { raise ArgumentError, "z" }.value rescue $!.class); p r001
