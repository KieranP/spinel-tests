# frozen_string_literal: true
# String#insert
p((+"ac").insert(1, "b"))
a073 = +"ac"; a073.insert(1, "b"); p a073
a074 = +"ac"; b074 = +"b"; a074.insert(1, b074); p a074
a075 = +"ac"; b075 = +"b"; c075 = (a075.insert(1, b075)); p c075
# insert positions by character index on a multibyte receiver
a076 = +"café"; a076.insert(2, "X"); p a076
a077 = +"café"; a077.insert(-1, "Z"); p a077
a078 = +"a☕b"; a078.insert(1, "-"); p a078
a079 = +"café"; b079 = +"X"; c079 = (a079.insert(2, b079)); p c079
# negative index counts from the end (insert after that character)
a080 = +"café"; a080.insert(-2, "•"); p a080

# On a String returned by Fiber#resume.
f81insert = Fiber.new { Fiber.yield('aabbcc'); nil }
w81insert = f81insert.resume
r81insert = (w81insert.insert(1, "z") rescue $!.class); p r81insert
