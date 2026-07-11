# frozen_string_literal: true
# Thread#new
p Thread.new { 40 + 2 }.value
t001 = Thread.new(7) { |a| a }
v001 = t001.value
p v001
p Thread.new(7, 8) { |a, b| [a, b] }.value
r001 = (Thread.new(1, 2, 3) { |a, b, c| a + b + c }.value rescue $!.class); p r001
r002 = (Thread.new rescue $!.class); p r002

# A method's block is not visible to `yield` inside a Thread.new body.
# Kept commented: the C compile abort takes down the whole file.
def yielder877
  t877 = Thread.new { yield 5 }
  t877.value
end
p(yielder877 { |x877| x877 * 2 })
v877 = yielder877 { |y877| y877 * 3 }; p v877

# The loop-nested form compiles but raises LocalJumpError at run time, so it
# stays live behind a rescue.
def yielder878
  t878 = Thread.new do
    r878 = nil
    loop { r878 = yield(5); break }
    r878
  end
  t878.value
end
r878v = (yielder878 { |z878| z878 * 2 } rescue $!.class); p r878v
t090 = [0].map { |w090| Thread.new do w090.to_s ensure nil end }; p t090.map(&:value)
t091 = [0].map { |w091| Thread.new { begin; nil; ensure; nil; end; w091 } }
v091 = t091.map(&:value); p v091

t970 = Thread.new { { "a" => 1 }.each { |w970, n970| p w970 } }; p t970.value.class
v971 = Thread.new { { "a" => 1 }.each { |w971, n971| p w971 } }.value; p v971.class
# a trailing expression after the each compiles
t972 = Thread.new { { "a" => 1 }.each { |w972, n972| p w972 }; nil }; p t972.value.class
v973 = Thread.new { { "a" => 1 }.each { |w973, n973| p w973 }; nil }.value; p v973.class
