# frozen_string_literal: true
# String#crypt
p("hello".crypt("ab"))
a01 = "hello"; p(a01.crypt("ab"))
a02 = "hello"; b02 = "ab"; p(a02.crypt(b02))
a03 = "hello"; b03 = "ab"; c03 = (a03.crypt(b03)); p c03
# same salt + same input is deterministic (this holds in Spinel too)
p("secret".crypt("Xy") == "secret".crypt("Xy"))

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_cr(ocr)
  case ocr
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_cr = (raisebr_cr("ab").crypt("aa").class rescue $!.class); p rb_cr

# On a String returned by Fiber#resume.
f81crypt = Fiber.new { Fiber.yield('aabbcc'); nil }
w81crypt = f81crypt.resume
r81crypt = (w81crypt.crypt("ab").class rescue $!.class); p r81crypt
