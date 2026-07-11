# frozen_string_literal: true
# Integer#abs2
p(5.abs2)
p(0.abs2)
p((-5).abs2)
p(5.abs2.class)
a001 = 5; p(a001.abs2)
b001 = -5; c001 = b001.abs2; p c001
# WONTFIX: See docs/limitations.md - "By design — Integer overflow"
# d001 = 2 ** 40; e001 = (d001.abs2 rescue $!.class); p e001
