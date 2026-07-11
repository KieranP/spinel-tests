# frozen_string_literal: true
# Hash#collect
p({ a: 1, b: 2 }.collect { |k, v| "#{k}=#{v}" })
cl_a = { a: 1, b: 2 }; p(cl_a.collect { |k, v| "#{k}=#{v}" })
cl_b = { a: 1, b: 2 }; cl_r = (cl_b.collect { |k, v| "#{k}=#{v}" }); p cl_r

# keys only (Symbol keys)
p({ a: 1, b: 2, c: 3 }.collect { |k, _v| k })
clk_a = { a: 1, b: 2, c: 3 }; clk_r = (clk_a.collect { |k, _v| k }); p clk_r

# String keys, transform values
p({ "x" => 10, "y" => 20 }.collect { |_k, v| v * 2 })
cls_a = { "x" => 10, "y" => 20 }; cls_r = (cls_a.collect { |_k, v| v * 2 }); p cls_r

# Integer keys, produce pairs
p({ 1 => "a", 2 => "b" }.collect { |k, v| [k, v] })
cli_a = { 1 => "a", 2 => "b" }; cli_r = (cli_a.collect { |k, v| [k, v] }); p cli_r

# Float values
p({ x: 1.5, y: 2.5 }.collect { |_k, v| v + 1.0 })
clf_a = { x: 1.5, y: 2.5 }; clf_r = (clf_a.collect { |_k, v| v + 1.0 }); p clf_r

# single-entry hash
p({ a: 1 }.collect { |k, _v| k })
cl1_a = { a: 1 }; cl1_r = (cl1_a.collect { |k, _v| k }); p cl1_r
