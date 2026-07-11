# frozen_string_literal: true
# String#encode
p("hello".encode("UTF-8"))
a01 = "hello"; p(a01.encode("UTF-8"))
a02 = "hello"; c02 = (a02.encode("UTF-8")); p c02
# no-argument encode returns a copy in the default internal encoding
p("hello".encode)
# encode to ASCII-8BIT keeps the ascii bytes
p("hello".encode("ASCII-8BIT").bytes)

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_en(oen)
  case oen
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_en = (raisebr_en("ab").encode.class rescue $!.class); p rb_en
