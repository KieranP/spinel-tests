# frozen_string_literal: true
# Proc#===
even120 = ->(x) { x.even? }
p(even120.call(4))
p(even120 === 4)
c120 = (even120 === 4); p c120
# Proc#=== drives case/when matching
r121 = case 4 when even120 then "even" else "odd" end; p(r121)
r122 = case 3 when even120 then "even" else "odd" end; p(r122)
v123 = (case 4 when even120 then "even" else "odd" end); p(v123)

# === on a non-lambda proc, and a multi-branch case/when over two proc patterns
sm130 = proc { |x| x < 10 }
p(sm130 === 4)
v130 = (sm130 === 4); p(v130)
big131 = ->(x) { x > 100 }
r131 = case 200 when sm130 then "small" when big131 then "big" else "mid" end; p(r131)
v131 = (case 50 when sm130 then "small" when big131 then "big" else "mid" end); p(v131)
# === through a proc held in a Hash is compared by value instead of called
tbl132 = { even: ->(x) { x.even? } }
p(tbl132[:even] === 4)
v132 = (tbl132[:even] === 4); p(v132)
p(case 4 when tbl132[:even] then "y" else "n" end)
p(tbl132[:even].call(4))
# === on a proc composed with >>
neg133 = (->(x) { x.even? } >> ->(b) { !b })
p(neg133 === 3)
v133 = (neg133 === 4); p(v133)
# === returns the proc's value, not a coerced boolean
val134 = ->(x) { x * 2 }
p(val134 === 5)
v134 = (val134 === 5); p(v134)
# a Proc pattern for #grep / #grep_v is refused at compile time
even135 = ->(x) { x.even? }; p([1, 2, 3, 4].grep(even135))
even136 = ->(x) { x.even? }; p([1, 2, 3, 4].grep_v(even136))
p([1, 2, 3, 4].grep(->(x) { x.even? }))
even138 = ->(x) { x.even? }; p([1, 2, 3, 4].select(&even138))
v138 = [1, 2, 3, 4].reject(&even138); p(v138)
