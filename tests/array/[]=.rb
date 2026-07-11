# frozen_string_literal: true
# Array#[]=

p([1, 2, 3][0] = 9)

a001 = [1, 2, 3]
p a001.class
a001[0] = 9
p a001

a002 = [1, 2, 3]
b002 = 9
p b002.class
a002[0] = b002
p a002

a003 = [1, 2, 3]
b003 = 9
c003 = (a003[0] = b003)
p c003.class
p c003

p([1.1, 2.2, 3.3][0] = 9.9)

a004 = [1.1, 2.2, 3.3]
p a004.class
a004[0] = 9.9
p a004

a005 = [1.1, 2.2, 3.3]
b005 = 9.9
p b005.class
a005[0] = b005
p a005

a006 = [1.1, 2.2, 3.3]
b006 = 9.9
c006 = (a006[0] = b006)
p c006.class
p c006

p(["a", "b", "c"][0] = "z")

a007 = ["a", "b", "c"]
p a007.class
a007[0] = "z"
p a007

a008 = ["a", "b", "c"]
b008 = "z"
p b008.class
a008[0] = b008
p a008

a009 = ["a", "b", "c"]
b009 = "z"
c009 = (a009[0] = b009)
p c009.class
p c009

# negative index
p([1, 2, 3][-1] = 9)
a010 = [1, 2, 3]
a010[-1] = 9
p a010

# index == size extends
p([1, 2, 3][3] = 9)
a011 = [1, 2, 3]
a011[3] = 9
p a011

# index beyond size nil-pads the gap
p([1, 2, 3][5] = 9)
a012 = [1, 2, 3]
a012[5] = 9
p a012

# [start, length] = replacement (same length)
p([1, 2, 3, 4, 5][1, 2] = [8, 9])
a013 = [1, 2, 3, 4, 5]
a013[1, 2] = [8, 9]
p a013

# [start, length] = grow
p([1, 2, 3, 4, 5][1, 2] = [7, 8, 9])
a014 = [1, 2, 3, 4, 5]
a014[1, 2] = [7, 8, 9]
p a014

# [start, length] = shrink
p([1, 2, 3, 4, 5][1, 3] = [8])
a015 = [1, 2, 3, 4, 5]
a015[1, 3] = [8]
p a015

# Range assignment
p([1, 2, 3, 4, 5][1..2] = [8, 9, 10])
a016 = [1, 2, 3, 4, 5]
a016[1..2] = [8, 9, 10]
p a016

# negative out-of-range raises IndexError
r017 = begin
  a017 = [1, 2, 3]
  a017[-5] = 9
rescue IndexError
  "IndexError"
end
p r017

g126 = [["a", "b"], ["c", "d"]]
cells126 = [[0, 1]]
r126, c126 = cells126.first
g126[r126][c126] = "X"
p g126

m127 = [[1, 4], [2, 5]]; m127[-1][1] = 99; p m127
[[7, 8], [9, 10]].tap { |g127| g127[-1][0] = 0; p g127 }

# (start, length) and Range assignment, including growth and beginless/endless
h281 = [1, 2, 3, 4, 5]; h281[1, 2] = [9]; p h281
h282 = [1, 2, 3, 4, 5]; h282[1..2] = [7, 7, 7]; p h282
h283 = [1, 2, 3, 4, 5]; h283[-1] = 0; p h283
h284 = [1, 2, 3, 4, 5]; h284[7] = 1; p h284
h285 = [1, 2, 3, 4, 5]; h285[1..] = [0]; p h285
h286 = [1, 2, 3, 4, 5]; h286[..1] = [0]; p h286
h287 = [1, 2, 3, 4, 5]; h287[1, 0] = [8, 8]; p h287
h288 = [1, 2, 3, 4, 5]; h288[1...3] = [0]; p h288
h289 = [1, 2, 3]; w289 = (h289[0] = 9); p w289; p h289
h290 = %w[a b c]; h290[1, 2] = %w[x]; p h290
h291 = []; h291[2] = 1; p h291

# growing past the end: an empty receiver drops the write, and a non-Integer
# receiver pads with the element type's zero value instead of nil
h292 = []; h292[0] = 1; p h292
h293 = []; h293[0] = "s"; p h293
h294 = Array.new(0); h294[0] = 1; p h294
h295 = []; h295[2] = 1; w295 = h295.size; p w295
h296 = [:x]; h296[3] = :y; p h296
h297 = [true]; h297[3] = false; p h297
h298 = [[1]]; h298[3] = [2]; p h298
h299 = ["x"]; h299[3] = "y"; p h299
h300 = [1.5]; h300[3] = 2.5; w300 = h300; p w300
# an Integer receiver, an in-range write, and #<< / #push are correct
h301b = [0]; h301b[2] = 1; p h301b
h302 = [1, 2, 3]; h302[7] = 1; p h302
h303 = [1]; h303[3] = 9; p h303
h304 = ["x"]; h304[0] = "y"; p h304
h305 = []; h305 << 1; p h305
h306 = []; h306.push(1); p h306

# a String index aborts the C build
a412 = [1, 2]; a412["x"] = 9; p a412
a413 = [1, 2]; a413[[0]] = 9; p a413

# a Symbol or nil index writes element 0 instead of raising TypeError
a414 = [1, 2]; r414 = ((a414[:s] = 9) rescue $!.class); p r414
a415 = [1, 2]; a415[:s] = 9; p a415
