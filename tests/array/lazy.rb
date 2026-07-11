# frozen_string_literal: true
# Array#lazy
p([1, 2, 3, 4].lazy.select(&:odd?).map { |n| n * 10 }.first(2))

a060 = [1, 2, 3, 4]
p a060.class
p a060.lazy.select(&:odd?).map { |n| n * 10 }.first(2)

a061 = [1, 2, 3, 4]
c061 = a061.lazy.select(&:odd?).map { |n| n * 10 }.first(2)
p c061.class
p c061

p([1.1, 2.2, 3.3, 4.4].lazy.select { |n| n > 2.0 }.map { |n| n * 10 }.first(2))

a062 = [1.1, 2.2, 3.3, 4.4]
p a062.class
p a062.lazy.select { |n| n > 2.0 }.map { |n| n * 10 }.first(2)

a063 = [1.1, 2.2, 3.3, 4.4]
c063 = a063.lazy.select { |n| n > 2.0 }.map { |n| n * 10 }.first(2)
p c063.class
p c063

p(["a", "b", "c", "d"].lazy.select { |s| s > "a" }.map { |s| s + "!" }.first(2))

a064 = ["a", "b", "c", "d"]
p a064.class
p a064.lazy.select { |s| s > "a" }.map { |s| s + "!" }.first(2)

a065 = ["a", "b", "c", "d"]
c065 = a065.lazy.select { |s| s > "a" }.map { |s| s + "!" }.first(2)
p c065.class
p c065

# argless first
p([1, 2, 3].lazy.first)
lz188 = [1, 2, 3].lazy.first; p lz188
# first(n), to_a, force and an intervening op are all correct:
p([1, 2, 3].lazy.first(2))
p([1, 2, 3].lazy.to_a)
p([1, 2, 3].lazy.force)
p([1, 2, 3].lazy.map { |i188| i188 }.first)

# a lazy enumerator crossing a local or method-return boundary
z235 = [1, 2, 3].lazy
p z235.first
def lzm235; [1, 2, 3].lazy.map { |i235| i235 * 2 }; end
p lzm235.first
v235 = lzm235.to_a; p v235

# A local assigned inside a `.lazy.map` block in a method body is never declared
# in the emitted C. Kept commented: a compile abort takes down the whole file.
def lzq600
#   ["a 5"].lazy.map { |l600| q600 = l600.split(" "); q600[0] }
end
p lzq600.to_a
v600 = lzq600.to_a; p v600
def lzq601
#   [1, 2].lazy.map { |x601| q601 = x601 * 2; q601 + 1 }
end
p lzq601.to_a
# inlining the local away compiles and matches
def lzq602
  ["a 5"].lazy.map { |l602| l602.split(" ")[0] }
end
p lzq602.to_a
v602 = lzq602.to_a; p v602
# the same block at top level (no method boundary) compiles and matches
r603 = ["a 5"].lazy.map { |l603| q603 = l603.split(" "); q603[0] }
p r603.to_a

# fused map/select chains terminated by first(n), to_a and force
h491 = [1, 2, 3, 4, 5, 6]
p h491.lazy.map { |x492| x492 * 2 }.first(3)
w491 = h491.lazy.map { |x493| x493 * 2 }.first(3); p w491
p h491.lazy.select(&:even?).to_a
w492 = h491.lazy.select(&:even?).to_a; p w492
p h491.lazy.map { |x494| x494 + 1 }.force
w494 = h491.lazy.map { |x495| x495 + 1 }.force; p w494
p h491.lazy.select { |x496| x496 > 2 }.map { |x497| x497 * 10 }.first(2)
p h491.lazy.take_while { |x498| x498 < 4 }.to_a
p h491.lazy.reject(&:odd?).to_a
