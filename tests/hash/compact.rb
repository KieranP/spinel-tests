# frozen_string_literal: true
# Hash#compact
p({ a: 1, b: nil }.compact)
a009 = { a: 1, b: nil }; p(a009.compact)
a010 = { a: 1, b: nil }; c010 = (a010.compact); p c010
p({ "x" => 1, "y" => nil, "z" => 3 }.compact)
a301 = { "x" => 1, "y" => nil, "z" => 3 }; p(a301.compact)
a302 = { "x" => 1, "y" => nil }; c302 = (a302.compact); p c302
p({ 1 => "a", 2 => nil, 3 => "c" }.compact)
a303 = { 1 => "a", 2 => nil }; c303 = (a303.compact); p c303
p({ a: 1, b: 2, c: 3 }.compact)
a304 = { a: 1, b: 2 }; c304 = (a304.compact); p c304
p({ a: nil, b: nil }.compact)
a305 = { a: nil, b: nil }; c305 = (a305.compact); p c305
p({ k: [1, 2], j: nil }.compact)
a306 = { k: [1, 2], j: nil }; c306 = (a306.compact); p c306
p({}.compact)
a307 = {}; p(a307.compact)
a308 = {}; c307 = (a308.compact); p c307

# On a Hash returned by a seedless Array#reduce.
a82cp = { n: 1, s: { x: 2 } }
h82cp = [a82cp].reduce { |acc82cp, l82cp| acc82cp }
r82cp = (h82cp.compact rescue $!.class); p r82cp
