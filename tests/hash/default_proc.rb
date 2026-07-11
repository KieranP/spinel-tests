# frozen_string_literal: true
# Hash#default_proc
p(Hash.new { |hash, k| hash[k] = k.to_s }.default_proc.class)
a219 = Hash.new { |hash, k| hash[k] = k.to_s }; c219 = a219.default_proc.call(a219, :x); p c219
b219 = { a: 1 }; p(b219.default_proc)

# The reader raises on any Hash.new receiver built without a block.
r892 = (Hash.new(0).default_proc rescue $!.class); p r892
r893 = (Hash.new.default_proc rescue $!.class); p r893
r894 = (Hash.new("x").default_proc rescue $!.class); p r894
h895 = Hash.new(0); r895 = (h895.default_proc rescue $!.class); p r895
# Control: literal Hashes report nil.
p({}.default_proc)
r896 = ({}.default_proc); p r896
p({ a: 1 }.default_proc)
r897 = ({ "a" => 1 }.default_proc); p r897
# Control: a Hash.new WITH a block reports its Proc, and calling it works.
p(Hash.new { |_h898, k898| k898.to_s }.default_proc.class)
h899 = Hash.new { |_h899, k899| k899.to_s }; r899 = h899.default_proc.call(h899, :q); p r899
