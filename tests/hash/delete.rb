# frozen_string_literal: true
# Hash#delete (with block for a missing key)
p({ a: 1 }.delete(:z) { |k| "missing #{k}" })
v005 = { a: 1 }.delete(:z) { |k| "missing #{k}" }; p(v005)
a119d = { a: 1 }; p(a119d.delete(:z) { |k| "missing #{k}" })
v006 = a119d.delete(:z) { |k| "missing #{k}" }; p(v006)
# delete a present key returns its value, hash is mutated
p({ a: 1, b: 2 }.delete(:a))
da01 = { a: 1, b: 2 }; db01 = (da01.delete(:a)); p db01; p(da01)
# delete a missing key without a block returns nil
p({ a: 1 }.delete(:z))
da02 = { a: 1 }; db02 = (da02.delete(:z)); p db02
# key supplied in a var
da03 = { a: 1, b: 2 }; dk03 = :b; db03 = (da03.delete(dk03)); p db03; p(da03)
# String keys
p({ "a" => 5, "b" => 6 }.delete("a"))
da04 = { "a" => 5, "b" => 6 }; db04 = (da04.delete("a")); p db04; p(da04)
p({ 1 => "x", 2 => "y" }.delete(1))
da05 = { 1 => "x", 2 => "y" }; db05 = (da05.delete(1)); p db05; p(da05)

# a splatted argument list
dk96 = [:a]
da96 = { a: 1 }; da96.delete(*dk96); p da96
da97 = { a: 1 }; db97 = da97.delete(*dk96); p db97

# The splat array still reaches the key slot unexpanded when it arrives as a
# method parameter — refused before any C is emitted.
# Kept commented: the front-end reject takes down the whole file.
def delete98(config, keys); config.delete(*keys); end
p(delete98({ a: 1 }, [:a]))
dv98 = delete98({ a: 1 }, [:a]); p dv98

# a container value returned by #delete, read through a local
hd377 = {}; hd377["a"] = [7, 8, 9]
xd377 = hd377.delete("a"); p xd377; p xd377[0]; p hd377
# the block form runs only for a missing key
p({ a: 1 }.delete(:z) { |k378| "none #{k378}" })
r378 = { a: 1 }.delete(:z) { |k| "none #{k}" }; p r378
p({ a: 1 }.delete(:a) { |k| "none #{k}" })
r379 = { a: 1 }.delete(:a) { |k| "none #{k}" }; p r379
