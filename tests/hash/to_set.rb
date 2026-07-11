# frozen_string_literal: true
require 'set'
# Hash#to_set
p({ a: 1 }.to_set)
a002 = { a: 1, b: 2 }; p(a002.to_set)
a003 = { a: 1, b: 2 }; c003 = (a003.to_set); p c003
a004 = { "a" => 1 }; c004 = (a004.to_set); p c004
a005 = {}; c005 = (a005.to_set); p c005
