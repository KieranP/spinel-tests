# frozen_string_literal: true
# Hash#default
p(Hash.new(7).default)
a320 = Hash.new(7); p(a320.default)
a321 = Hash.new(7); c321 = (a321.default); p c321
a322 = {}; c322 = (a322.default); p c322
# default with no default value set -> nil
p({ a: 1 }.default)
a323d = { a: 1 }; c323d = (a323d.default); p c323d
# Hash.new(0) default is 0
p(Hash.new(0).default)
a324d = Hash.new(0); c324d = (a324d.default); p c324d
# reading default is unaffected by accessing a missing key
a325d = Hash.new(7); a325d[:missing]; p(a325d.default)
# a Hash with a default block reports nil from #default (no key given)
p(Hash.new { |_h, k| k.to_s }.default)
a326d = Hash.new { |_h, k| k.to_s }; c326d = (a326d.default); p c326d
# String-key literal hash has nil default
p({ "a" => 1 }.default)
a327d = { "a" => 1 }; c327d = (a327d.default); p c327d

# default with a key argument returns the default value
p(Hash.new(7).default(:x))
za910 = Hash.new(7); zc910 = (za910.default(:x)); p zc910
# default(key) on a block-default hash calls the block
p(Hash.new { |_h, k| k.to_s }.default(:foo))
za911 = Hash.new { |_h, k| k.to_s }; zc911 = (za911.default(:foo)); p zc911
# default on an empty literal hash is nil
p({}.default)
za912 = {}; zc912 = (za912.default); p zc912
