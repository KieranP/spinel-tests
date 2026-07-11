# frozen_string_literal: true
# Hash#empty?

p({}.empty?)
p({ a: 1 }.empty?)
p({ a: 1, b: 2 }.empty?)
p({ "x" => 1 }.empty?)
p({ 1 => "one" }.empty?)

a001 = {}; r001 = a001.empty?; p r001
a002 = { a: 1 }; r002 = a002.empty?; p r002
a003 = { "x" => 1.1, "y" => 2.2 }; r003 = a003.empty?; p r003
a004 = { 1 => "one", 2 => "two" }; r004 = a004.empty?; p r004
a005 = { a: { x: 1 } }; r005 = a005.empty?; p r005

# empty? after clear
b001 = { a: 1, b: 2 }; b001.clear; p b001.empty?
