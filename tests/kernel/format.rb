# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# Kernel#format
p(format("%05.2f", 3.14159))
c010 = format("%05.2f", 3.14159); p(c010)
p(format("%+d", 42))
c011 = format("%+d", 42); p(c011)
p(format("%x", 255))
c012 = format("%x", 255); p(c012)
p(format("%o", 8))
c013 = format("%o", 8); p(c013)
p(format("%b", 5))
c014 = format("%b", 5); p(c014)
p(format("%-10s|", "hi"))
c015 = format("%-10s|", "hi"); p(c015)
p(format("%10s|", "hi"))
c016 = format("%10s|", "hi"); p(c016)
p(format("%c", 65))
c017 = format("%c", 65); p(c017)
p(format("%%"))
c018 = format("%%"); p(c018)
p(format("%.3s", "hello"))
c019 = format("%.3s", "hello"); p(c019)
p(format("%#x", 255))
c020 = format("%#x", 255); p(c020)
p(format("%*d", 5, 42))
c021 = format("%*d", 5, 42); p(c021)
p(format("%.*f", 2, 3.14159))
c022 = format("%.*f", 2, 3.14159); p(c022)
p(format("%<name>s!", name: "hi"))
c023 = format("%<name>s!", name: "hi"); p(c023)
p(format("%2$s %1$s", "a", "b"))
c024 = format("%2$s %1$s", "a", "b"); p(c024)
r003 = (format("%d %d %d", 1, 2) rescue "too few arguments"); p r003
p(format("%x", -255))
c030 = format("%x", -255); p(c030)
p(format("%o", -8))
c031 = format("%o", -8); p(c031)
p(format("%b", -5))
c032 = format("%b", -5); p(c032)

# the rest of the directive set
p(format("%i", 42))
c040 = format("%i", 42); p(c040)
p(format("%e", 1234.5678))
c041 = format("%e", 1234.5678); p(c041)
p(format("%E", 1234.5678))
p(format("%g", 1234.5678))
p(format("%G", 0.000012345))
p(format("%s", nil))
p(format("%s", [1, 2]))
p(format("%s", :sym))
p(format("%p", "hi"))
c042 = format("%p", nil); p(c042)
p(format("%X", 255))
p(format("%B", 5))
p(format("%#o", 8))
p(format("%#b", 5))
p(format("%#X", 255))
p(format("%c", "abc"))
p(format("%c", 955))
p(format("%%d"))

# flags, width and precision
p(format("% d", 42))
c043 = format("% d", 42); p(c043)
p(format("%+d", -42))
p(format("%08.3f", 3.14159))
p(format("%-8d|", 42))
p(format("%+.2e", 12345.0))
p(format("%5.1f", 2.345))
p(format("%.5d", 42))
p(format("%.5x", 255))
p(format("%20.10s|", "hello world"))
p(format("%-20.3s|", "hello"))
p(format("%010.4e", 1234.5))
p(format("%#010x", 255))
p(format("%d", 3.99))
p(format("%d", "42"))
p(format("%f", 3))
p(format("%*d", -6, 42))
c044 = format("%-*d|", 6, 42); p(c044)
p(format("%{a} and %{b}", a: 1, b: 2))
c045 = format("%<x>05.2f", x: 3.14159); p(c045)

# the + and space flags are dropped for %x / %X / %o, and %u is refused
p(format("%+x", 255))
c046 = format("% x", 255); p(c046)
p(format("%+X", 255))
p(format("%+o", 8))
r047 = (format("%u", 42) rescue $!.class); p r047

# a negative `*` precision truncates, and malformed formats are not rejected
p(format("%.*f", -2, 3.14159))
c048 = format("%.*f", -2, 3.14159); p(c048)
r049 = (format("%") rescue $!.class); p r049
r050 = (format("%1$s %s", "a", "b") rescue $!.class); p r050
r051 = (format("%d %<a>d", 1, { a: 2 }) rescue $!.class); p r051
# an array literal at the same call site works
a150 = ["a", "b"]
r150 = (begin; format("%s%s", *a150); rescue ArgumentError => e150; e150.class; end); p r150
a151 = ["a", "b"]
v151 = (begin; format("%s%s", *a151); rescue ArgumentError => e151; e151.class; end); p v151
p(format("%s%s", *["a", "b"]))
p(format("%.2f", 2.675))
v152 = format("%.1f", 0.15); p v152
p(format("%.2f", 1.115))
p(format("%.1f", 0.45))

# raising TypeError
r9601 = (format("%d", nil) rescue $!.class); p r9601
r9602 = (format("%f", nil) rescue $!.class); p r9602
r9603 = (format("%x", nil) rescue $!.class); p r9603
