# frozen_string_literal: true
# Hash#fetch
p({ a: 1 }.fetch(:z, 0))
a021 = { a: 1 }; p(a021.fetch(:z, 0))
a022 = { a: 1 }; b022 = :z; p(a022.fetch(b022, 0))
a023 = { a: 1 }; b023 = :z; c023 = (a023.fetch(b023, 0)); p c023
p({ a: 1 }.fetch(:z) { |k| "no #{k}" })
a301 = { a: 1 }; c301 = (a301.fetch(:z) { |k| "no #{k}" }); p c301
r302 = ({ a: 1 }.fetch(:z) rescue "keyerr"); p r302
# present key
p({ a: 1 }.fetch(:a))
fa01 = { a: 1 }; fb01 = (fa01.fetch(:a)); p fb01
# present key, arg in a var
fa02 = { a: 1 }; fk02 = :a; fb02 = (fa02.fetch(fk02)); p fb02
# default value used for a missing key
p({ a: 1 }.fetch(:z, 99))
fa03 = { a: 1 }; fb03 = (fa03.fetch(:z, 99)); p fb03
# String default
p({ a: 1 }.fetch(:z, "dflt"))
fa04 = { a: 1 }; fb04 = (fa04.fetch(:z, "dflt")); p fb04
# String keys
p({ "a" => 5 }.fetch("a"))
fa05 = { "a" => 5 }; fb05 = (fa05.fetch("a")); p fb05
# Integer keys
p({ 1 => "x" }.fetch(1))
fa06 = { 1 => "x" }; fb06 = (fa06.fetch(1)); p fb06
# block not called for a present key
p({ a: 1 }.fetch(:a) { 0 })
fa07 = { a: 1 }; fb07 = (fa07.fetch(:a) { 0 }); p fb07
# missing key raises KeyError -> rescue
fa08 = { a: 1 }; fr08 = (fa08.fetch(:missing) rescue "no key"); p fr08

# a splatted argument list
k96 = [:a]
p({ a: 1 }.fetch(*k96))
v96 = { a: 1 }.fetch(*k96); p v96
# A splatted argument list whose length is not statically known — here the
# array arrives as a method parameter — is refused before any C is emitted.
# Kept commented: the front-end reject takes down the whole file.
def fetch97(config, keys); config.fetch(*keys); end
p(fetch97({ a: 1 }, [:a]))
v97 = fetch97({ a: 1 }, [:a]); p v97

# the same splatted argument list with an Integer key
k98 = [1]
r98 = ({ 1 => :x }.fetch(*k98) rescue $!.class); p r98
v98 = ({ 1 => :x }.fetch(*k98) rescue $!.class); p v98

# Control: the same arguments spread positionally match.
p({ a: 1 }.fetch(:a))
v99 = { 1 => :x }.fetch(1); p v99

# An Array fetched out of a {}-created Hash reads nil at every Integer index once
# it is bound to a local.
hf377 = {}
hf377["a"] = [7, 8, 9]
rf377 = hf377.fetch("a")
p rf377[0]
wf377 = rf377[0]; p wf377

# With BOTH a default and a block, Ruby calls the block and ignores the default.
p({ a: 1 }.fetch(:z, 9) { |k763| k763 })
v763 = { a: 1 }.fetch(:z, 9) { |k| k }; p v763
p({ "a" => 1 }.fetch("z", "dflt") { |k764| k764.upcase })
v764 = { "a" => 1 }.fetch("z", "dflt") { |k| k.upcase }; p v764
# Control: a present key ignores both the default and the block.
p({ a: 1 }.fetch(:a, 9) { |k| k })
v765 = { a: 1 }.fetch(:a, 9) { |k| k }; p v765

# fetch reaching a container value, read back through a local
h766 = { a: [7, 8, 9] }; r766 = h766.fetch(:a); p r766; p r766[0]
h767 = { a: { b: 1 } }; r767 = h767.fetch(:a); p r767; p r767[:b]
# fetch on a Hash.new(default) receiver still raises for a missing key
r768 = (Hash.new(0).fetch(:z) rescue $!.class); p r768
