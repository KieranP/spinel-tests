# frozen_string_literal: true
# String#squeeze!
p((+"aaabbbccc").squeeze!)
a01 = +"aaabbbccc"; a01.squeeze!; p a01
a02 = +"aaabbbccc"; b02 = +"a-b"; a02.squeeze!(b02); p a02
a03 = +"aaabbbccc"; b03 = +"a-b"; c03 = (a03.squeeze!(b03)); p c03
# no runs to squeeze returns nil (no change)
p((+"abc").squeeze!)
a04 = +"abc"; c04 = (a04.squeeze!); p c04

# On a String returned by Fiber#resume.
f81squeezeb = Fiber.new { Fiber.yield('aabbcc'); nil }
w81squeezeb = f81squeezeb.resume
r81squeezeb = (w81squeezeb.squeeze! rescue $!.class); p r81squeezeb
