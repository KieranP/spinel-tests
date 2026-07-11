# frozen_string_literal: true
# Hash#detect
p({ a: 1, b: 2 }.detect { |_k, v| v == 2 })
dt_a = { a: 1, b: 2 }; p(dt_a.detect { |_k, v| v == 2 })
dt_b = { a: 1, b: 2 }; dt_r = (dt_b.detect { |_k, v| v == 2 }); p dt_r

# String keys
p({ "a" => 1, "b" => 2 }.detect { |_k, v| v == 2 })
dts_a = { "a" => 1, "b" => 2 }; dts_r = (dts_a.detect { |_k, v| v == 2 }); p dts_r

# Integer keys, match on key
p({ 1 => "x", 2 => "y" }.detect { |k, _v| k == 2 })
dti_a = { 1 => "x", 2 => "y" }; dti_r = (dti_a.detect { |k, _v| k == 2 }); p dti_r

# no match -> nil
p({ a: 1 }.detect { |_k, v| v > 5 })
dtn_a = { a: 1 }; dtn_r = (dtn_a.detect { |_k, v| v > 5 }); p dtn_r

# Float values
p({ x: 1.5, y: 2.5 }.detect { |_k, v| v > 2.0 })
dtf_a = { x: 1.5, y: 2.5 }; dtf_r = (dtf_a.detect { |_k, v| v > 2.0 }); p dtf_r

# On a Hash returned by a seedless Array#reduce.
a82dt = { n: 1, s: { x: 2 } }
h82dt = [a82dt].reduce { |acc82dt, l82dt| acc82dt }
r82dt = (h82dt.detect { |k82dt, v82dt| k82dt == :n } rescue $!.class); p r82dt
