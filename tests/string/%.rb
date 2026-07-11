# frozen_string_literal: true
# String#%
p("%05d" % 42)
a001 = "%05d"; p(a001 % 42)
a002 = "%05d"; b002 = 42; p(a002 % b002)
a003 = "%05d"; b003 = 42; c003 = (a003 % b003); p c003
# String#% with a bare nil / Rational operand
p("x=%s" % nil)
v077a = ("x=%s" % nil); p v077a
p("%.2f" % (1r/3))
v077b = ("%.2f" % (1r/3)); p v077b
# String#% with %a hex-float directive
p("%a" % 1.0)
v078 = ("%a" % 1.0); p v078
# integer / string / float / hex / octal / binary directives with multiple args
p("%d|%s|%.2f|%x|%o|%b" % [42, "hi", 3.14159, 255, 8, 5])
v079 = ("%d|%s|%.2f|%x|%o|%b" % [42, "hi", 3.14159, 255, 8, 5]); p v079
# scientific / general / inspect directives
p("%e|%g|%p" % [12345.678, 0.0001, [1, 2]])
v080 = ("%e|%g|%p" % [12345.678, 0.0001, [1, 2]]); p v080
# flags: zero-pad + precision, forced sign, left-justify, alternate form, space sign
p("%05.2f|%+d|%-10s|%#x|% d" % [3.14159, 7, "hi", 255, 5])
v081 = ("%05.2f|%+d|%-10s|%#x|% d" % [3.14159, 7, "hi", 255, 5]); p v081
# literal percent and dynamic (*) width
p("100%% [%*d] [%-*d]" % [5, 42, 5, 7])
v082 = ("100%% [%*d] [%-*d]" % [5, 42, 5, 7]); p v082
# hash-named references
p("%<a>d and %<b>s" % {a: 1, b: "x"})
p("%{a}-%{b}" % {a: 1, b: "x"})
v083 = ("%<a>05d" % {a: 42}); p v083
# %c with an ASCII codepoint and an ASCII string argument
p("%c%c" % [65, "Z"])
# %c should emit a whole character; a multibyte codepoint / char must not be byte-truncated
v084 = ("%c" % 9749); p v084.bytes
v085 = ("%c" % "☕"); p v085.bytes
# positional (%N$s) references reuse an argument by index
p("%1$s %2$s %1$s" % ["a", "b"])
v086 = ("%1$s %2$s %1$s" % ["a", "b"]); p v086

# On a String returned by Fiber#resume.
f81pct = Fiber.new { Fiber.yield('v=%d'); nil }
w81pct = f81pct.resume
r81pct = (w81pct % [5] rescue $!.class); p r81pct
r_nd = ("%d" % "x" rescue $!.class); p r_nd
r_mk = ("%{z}" % { a: 1 } rescue $!.class); p r_mk
# a numeric String operand and a present key both convert
p("%d" % "12")
v_ns = ("%d" % "12"); p v_ns
# precision on a String, and width + precision on a Float
p("%.3s" % "hello")
p("%8.3f" % 3.14159)
p("%-8.2f|" % 3.14159)
v_wp = ("%8.3f" % 3.14159); p v_wp
# too few arguments raises
r_fa = ("%s %s" % ["a"] rescue $!.class); p r_fa
# %X upper-case hex, and alternate-form octal / binary
p("%X" % 255)
p("%#o|%#b" % [8, 5])
# a width taken from a local
w_w = 8; p("%*s" % [w_w, "hi"])
v_dw = ("%*s" % [w_w, "hi"]); p v_dw
# a Symbol operand for %s
p("%s" % :sym)
