# frozen_string_literal: true
# Range#% (step alias)
p(((1..10) % 3).to_a)
r060 = (((1..10) % 3).to_a); p r060
p(((1..10) % 4).to_a)
a061 = (1..10); b061 = 3; p((a061 % b061).to_a)
r062 = ((("a".."e") % 2).to_a rescue $!.class); p r062
# WONTFIX: See docs/limitations.md - "By design — Range#step / Range#% return a materialized Array, not an ArithmeticSequence"
# p((1..10) % 2)
# WONTFIX: See docs/limitations.md - "By design — Range#step / Range#% return a materialized Array, not an ArithmeticSequence"
# v110 = ((1..10) % 2); p v110
