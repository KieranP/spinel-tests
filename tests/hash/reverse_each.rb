# frozen_string_literal: true
# Hash#reverse_each
out = []; { a: 1, b: 2 }.reverse_each { |k, _v| out << k }; p out
re1 = { a: 1, b: 2 }; ro1 = []; re1.reverse_each { |k, _v| ro1 << k }; p ro1
