# frozen_string_literal: true
# Hash#to_hash
p({ a: 1 }.to_hash)
th1 = { a: 1 }; th2 = (th1.to_hash); p th2
p({ "x" => 1, "y" => 2 }.to_hash)
za901 = { "x" => 1, "y" => 2 }.to_hash; p za901
p({}.to_hash)
za902 = {}.to_hash; p za902
