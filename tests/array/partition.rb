# frozen_string_literal: true
# Array#partition

p([1, 2, 3, 4].partition(&:even?))

a001 = [1, 2, 3, 4]
p a001.class
p a001.partition(&:even?)

a002 = [1, 2, 3, 4]
c002 = a002.partition(&:even?)
p c002.class
p c002

p([1.5, 2.5, 3.5, 4.5].partition { |f| f > 2.5 })

a003 = [1.5, 2.5, 3.5, 4.5]
p a003.class
p a003.partition { |f| f > 2.5 }

a004 = [1.5, 2.5, 3.5, 4.5]
c004 = a004.partition { |f| f > 2.5 }
p c004.class
p c004

p(["a", "bb", "c", "dd"].partition { |s| s.length > 1 })

a005 = ["a", "bb", "c", "dd"]
p a005.class
p a005.partition { |s| s.length > 1 }

a006 = ["a", "bb", "c", "dd"]
c006 = a006.partition { |s| s.length > 1 }
p c006.class
p c006

# predicate and identity blocks, over Integer, mixed and empty receivers
g931 = [1, 2, 3, 4, 5]
p g931.partition { |x931| x931.odd? }
v931 = g931.partition { |x932| x932 > 2 }; p v931
p g931.partition { |x933| x933 }
g934 = ["a", "bb", "ccc"]
p g934.partition { |s934| s934.length > 1 }
v934 = g934.partition { |s935| s935.length > 1 }; p v934
g936 = []
p g936.partition { |x936| x936.to_s.empty? }
g937 = [1, nil, 2]
p g937.partition { |x937| x937.nil? }
v937 = g937.partition { |x938| x938.nil? }; p v937
g939 = [[1, 2], [3]]
p g939.partition { |r939| r939.size > 1 }
g940 = [1, nil, 2]; p g940.partition { |x940| x940 }
p([].partition { |x941| x941 })
