# frozen_string_literal: true
# Integer#divmod
p(7.divmod(3))
a046 = 7; p(a046.divmod(3))
a047 = 7; b047 = 3; p(a047.divmod(b047))
a048 = 7; b048 = 3; c048 = (a048.divmod(b048)); p c048

# Integer#divmod with a non-Integer argument
p(13.divmod(2.5))
a246 = 13; b246 = 4.0; c246 = (a246.divmod(b246)); p c246
p(10.divmod(3r))

# Integer#divmod with negative operands (quotient floors, remainder takes divisor's sign)
p((-7).divmod(3))
p(7.divmod(-3))
p((-7).divmod(-3))
a049 = -7; b049 = 3; c049 = (a049.divmod(b049)); p c049

# Integer#divmod with a negative Float argument
p((-7).divmod(2.5))
p(7.divmod(-2.5))
p((-7).divmod(-2.5))
a052 = -7; b052 = -2.5; c052 = (a052.divmod(b052)); p c052

# Integer#divmod by zero -> ZeroDivisionError
r050 = (5.divmod(0) rescue $!.class); p r050
a050 = 5; b050 = 0; r050b = (a050.divmod(b050) rescue $!.class); p r050b

p((2 ** 100).divmod(7))
a051 = 2 ** 100; b051 = 7; c051 = (a051.divmod(b051)); p c051

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_iv(oiv)
  case oiv
  when Integer then 7
  when String  then 12
  else raise ArgumentError, "no"
  end
end
rb_iv = (raisebr_iv("ab").divmod(3) rescue $!.class); p rb_iv

r880 = (5.divmod("x") rescue $!.class); p r880

# Integer#divmod with a nil argument (Ruby raises TypeError)
r881 = (5.divmod(nil) rescue $!.class); p r881
