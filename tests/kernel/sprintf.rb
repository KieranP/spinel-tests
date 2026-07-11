# frozen_string_literal: true
# Kernel#sprintf
p(sprintf("%d and %s", 1, "two"))
c025 = sprintf("%d and %s", 1, "two"); p(c025)
p(sprintf("%x", -255))
c026 = sprintf("%x", -255); p(c026)
p(sprintf("%o", -8))
c027 = sprintf("%o", -8); p(c027)
# positional (%1$s), width-from-arg (%*d), and alternate-form hex (%#x)
p(sprintf("%1$s %2$s %1$s", "a", "b"))
c028 = sprintf("%1$s %2$s %1$s", "a", "b"); p(c028)
p(sprintf("[%*d]", 6, 42))
c029 = sprintf("[%*d]", 6, 42); p(c029)
p(sprintf("%#x", 255))
c030 = sprintf("%#x", 255); p(c030)
p(sprintf("%e", 1234.5678))
c031 = sprintf("%e", 1234.5678); p(c031)
p(sprintf("%g", 0.000012345))
p(sprintf("%p", [1, "a"]))
p(sprintf("%{k}!", k: "v"))
c032 = sprintf("%<k>-6s|", k: "v"); p(c032)
p(sprintf("%.*f", 3, 3.14159))
p(sprintf("%+x", 255))
c033 = sprintf("%+o", 8); p(c033)
r034 = (sprintf("%u", 42) rescue $!.class); p r034
a153 = ["a", "b"]
r153 = (begin; sprintf("%s%s", *a153); rescue ArgumentError => e153; e153.class; end); p r153
a154 = ["a", "b"]
v154 = (begin; sprintf("%s%s", *a154); rescue ArgumentError => e154; e154.class; end); p v154
p(sprintf("%.2f", 2.675))
v155 = sprintf("%.1f", 0.15); p v155

# raising TypeError
r9611 = (sprintf("%d", nil) rescue $!.class); p r9611
