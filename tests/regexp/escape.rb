# frozen_string_literal: true
# Regexp.escape
p(Regexp.escape("a.b*c"))
a001 = "a.b*c"; p(Regexp.escape(a001))
a002 = "a.b*c"; c002 = (Regexp.escape(a002)); p c002

# Regexp.quote (alias of Regexp.escape)
p(Regexp.quote("a.b*c"))
a003 = "a.b*c"; p(Regexp.quote(a003))
a004 = "a.b*c"; c004 = (Regexp.quote(a004)); p c004

# Escape covers every metacharacter, and a space
p(Regexp.escape("[]{}()|-*.\\?+^$# "))
a005 = "a+b(c)"; v005 = Regexp.escape(a005); p v005
p(Regexp.escape("plain"))

# An escaped pattern matches its source literally
p(Regexp.new(Regexp.escape("a.b")).match?("a.b"))
p(Regexp.new(Regexp.escape("a.b")).match?("axb"))

# Control characters become their two-character escapes
p(Regexp.escape("a\nb"))
p(Regexp.escape("a\tb"))
a006 = "a\rb"; v006 = Regexp.quote(a006); p v006
