# frozen_string_literal: true
# Array#flat_map

p [1, 2, 3].flat_map { |x| x }

p([1, 2, 3].flat_map { |n| [n, -n] })

a001 = [1, 2, 3]
p a001.class
p a001.flat_map { |n| [n, -n] }

a002 = [1, 2, 3]
c002 = a002.flat_map { |n| [n, -n] }
p c002.class
p c002

p([1.1, 2.2, 3.3].flat_map { |f| [f, -f] })

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.flat_map { |f| [f, -f] }

a004 = [1.1, 2.2, 3.3]
c004 = a004.flat_map { |f| [f, -f] }
p c004.class
p c004

p(["a", "b", "c"].flat_map { |s| [s, s] })

a005 = ["a", "b", "c"]
p a005.class
p a005.flat_map { |s| [s, s] }

a006 = ["a", "b", "c"]
c006 = a006.flat_map { |s| [s, s] }
p c006.class
p c006

# nested-array block: elements are themselves arrays
p([[1], [2]].flat_map { |x| x })

a007 = [[1], [2]]
c007 = a007.flat_map { |x| x }
p c007

# mix of scalar and array returns
p([1, 2].flat_map { |x| x.even? ? [x, x] : x })

a008 = [1, 2]
c008 = a008.flat_map { |x| x.even? ? [x, x] : x }
p c008

# empty receiver
p([].flat_map { |x| [x] })

a009 = []
c009 = a009.flat_map { |x| [x] }
p c009

# block returning nested arrays: only one level is flattened
p([1, 2].flat_map { |x| [[x]] })

a010 = [1, 2]
c010 = a010.flat_map { |x| [[x]] }
p c010

# A combination(2).select{}.map{} chain on a destructured block parameter emits ill-typed C.
# Kept commented: a compile abort takes down the whole file.
h960 = { "a" => [1, 2, 3] }
p(h960.flat_map { |k960, r960| r960.combination(2).select { |x960, y960| x960 < y960 }.map { |x961, y961| x961 + y961 } })
v960 = h960.flat_map { |k962, r962| r962.combination(2).select { |x962, y962| x962 < y962 }.map { |x963, y963| x963 + y963 } }; p v960

# only one level is flattened
p([[1, 2], [3, [4]]].flat_map { |x451| x451 })
w451 = [[1, 2], [3, [4]]].flat_map { |x452| x452 }; p w451
p([1, 2].flat_map { |x453| [x453, x453] })
w453 = [1, 2].flat_map { |x454| [x454, x454] }; p w453
h455 = [{ t: %w[a b] }, { t: %w[c] }]
p h455.flat_map { |r455| r455[:t] }
w455 = h455.flat_map { |r456| r456[:t] }; p w455
p([].flat_map { |x457| [x457] })
p([1, 2].flat_map { |x458| x458 })
