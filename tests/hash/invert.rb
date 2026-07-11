# frozen_string_literal: true
# Hash#invert
p({ a: 1, b: 2 }.invert)
a032 = { a: 1, b: 2 }; p(a032.invert)
a033 = { a: 1, b: 2 }; c033 = (a033.invert); p c033
p({ a: 1, b: 1 }.invert)
za901 = { a: 1, b: 1 }.invert; p za901
p({ "x" => 1, "y" => 2 }.invert)
za902 = { "x" => 1, "y" => 2 }.invert; p za902
p({ 1 => 10, 2 => 20 }.invert)
za903 = { 1 => 10, 2 => 20 }.invert; p za903
p({}.invert)
za904 = {}.invert; p za904
p({ a: 1, b: 2 }.invert.invert)
za905 = { a: 1, b: 2 }.invert.invert; p za905

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_hi(ohi)
  case ohi
  when Integer then {"a" => 1}
  when String  then {"b" => 2}
  else raise ArgumentError, "no"
  end
end
rb_hi = (raisebr_hi("ab").invert rescue $!.class); p rb_hi

# On a Hash returned by a seedless Array#reduce.
a82iv = { n: 1, s: { x: 2 } }
h82iv = [a82iv].reduce { |acc82iv, l82iv| acc82iv }
r82iv = (h82iv.invert rescue $!.class); p r82iv
