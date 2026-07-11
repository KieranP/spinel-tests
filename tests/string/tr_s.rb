# frozen_string_literal: true
# String#tr_s
p("hello".tr_s("l", "r"))
a01 = "hello"; p(a01.tr_s("l", "r"))
a02 = "hello"; b02 = "l"; p(a02.tr_s(b02, "r"))
a03 = "hello"; b03 = "l"; c03 = (a03.tr_s(b03, "r")); p c03
# translate-and-squeeze collapses runs produced by the translation
p("aabbcc".tr_s("a-c", "x"))
p("mississippi".tr_s("sp", "*"))
# deletion when replacement is shorter than the search set
p("hello".tr_s("l", ""))
# receiver is unchanged
a04 = "aaa"; a04.tr_s("a", "b"); p a04

# On a String returned by Fiber#resume.
f81tr_s = Fiber.new { Fiber.yield('aabbcc'); nil }
w81tr_s = f81tr_s.resume
r81tr_s = (w81tr_s.tr_s("a", "x") rescue $!.class); p r81tr_s
