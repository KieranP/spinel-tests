# frozen_string_literal: true
# Integer#<=>
p(3 <=> 5)
a309 = 3; p(a309 <=> 5)
a310 = 3; b310 = 5; p(a310 <=> b310)
a311 = 3; b311 = 5; c311 = (a311 <=> b311); p c311

# equal / greater / less
p(5 <=> 5)
p(5 <=> 3)
p(0 <=> 0)
p((-5) <=> 3)
p(3 <=> (-5))
a312 = 5; b312 = 5; c312 = (a312 <=> b312); p c312
a313 = 5; b313 = 3; c313 = (a313 <=> b313); p c313

# Float argument
p(3 <=> 3.0)
p(3 <=> 3.5)
p(3 <=> 2.5)
a314 = 3; b314 = 3.0; c314 = (a314 <=> b314); p c314

# non-comparable argument -> nil
p(3 <=> "x")
p(3 <=> nil)
a315 = 3; b315 = "x"; c315 = (a315 <=> b315); p c315

# Bignum (Fixnum<=>Bignum returns the right sign on both)
p(5 <=> (2 ** 100))
p((2 ** 100) <=> 5)
a316 = 2 ** 100; c316 = (a316 <=> 5); p c316
p((2 ** 100) <=> (2 ** 100))
a317 = 2 ** 100; b317 = 2 ** 100; c317 = (a317 <=> b317); p c317
