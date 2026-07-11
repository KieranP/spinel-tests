# frozen_string_literal: true
# Hash#sort_by
p({ a: 1, b: 2 }.sort_by { |_k, v| -v })
a063 = { a: 1, b: 2 }; p(a063.sort_by { |_k, v| -v })
a064 = { a: 1, b: 2 }; c064 = (a064.sort_by { |_k, v| -v }); p c064
p({ c: 3, a: 1, b: 2 }.sort_by { |_k, v| v })
b063 = { c: 3, a: 1, b: 2 }; c164 = (b063.sort_by { |_k, v| v }); p c164
p({ "c" => 3, "a" => 1, "b" => 2 }.sort_by { |_k, v| v })
b064 = { "c" => 3, "a" => 1, "b" => 2 }; c264 = (b064.sort_by { |_k, v| v }); p c264
p({ 2 => "b", 1 => "a", 3 => "c" }.sort_by { |k, _v| k })
b065 = { 2 => "b", 1 => "a", 3 => "c" }; c364 = (b065.sort_by { |k, _v| k }); p c364
p({ x: 3.5, y: 1.5, z: 2.5 }.sort_by { |_k, v| v })
b066 = { x: 3.5, y: 1.5, z: 2.5 }; c464 = (b066.sort_by { |_k, v| v }); p c464
p({ a: 1, b: 2 }.sort_by.class)
# sort descending by value, take top keys (captured chain)
zh501 = { alice: 85, bob: 92, carol: 78 }; zr501 = zh501.sort_by { |_k, v| -v }.first(2).map(&:first); p zr501
# sort by key length (String keys), rebuild a Hash
zh502 = { "ccc" => 1, "a" => 2, "bb" => 3 }; zr502 = zh502.sort_by { |k, _v| k.length }.to_h; p zr502
