# frozen_string_literal: true
# String#casecmp?
p("Hello".casecmp?("hello"))
a022 = "Hello"; p(a022.casecmp?("hello"))
a023 = "Hello"; b023 = "hello"; p(a023.casecmp?(b023))
a024 = "Hello"; b024 = "hello"; c024 = (a024.casecmp?(b024)); p c024

# On a String returned by Fiber#resume.
f81casecmpq = Fiber.new { Fiber.yield('aabbcc'); nil }
w81casecmpq = f81casecmpq.resume
r81casecmpq = (w81casecmpq.casecmp?("AABBCC") rescue $!.class); p r81casecmpq

# embedded NUL: the bytes after the NUL still take part in the comparison
p("a\0b".casecmp?("a\0c"))
a025cq = "a\0b"; b025cq = "a\0c"; v025cq = a025cq.casecmp?(b025cq); p v025cq
