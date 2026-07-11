# frozen_string_literal: true
# Array#filter!
p([1, 2, 3, 4].filter! { |xa| xa.even? })

a001 = [1, 2, 3, 4]
p a001.class
a001.filter! { |xa| xa.even? }
p a001

a002 = [1, 2, 3, 4]
c002 = a002.filter! { |xa| xa.even? }
p c002.class
p c002

# none removed -> returns nil, array unchanged
p([1, 2, 3].filter! { |xa| xa > 0 })

a003 = [1, 2, 3]
c003 = a003.filter! { |xa| xa > 0 }
p c003.class
p c003
p a003

p([1.1, 2.2, 3.3, 4.4].filter! { |xb| xb > 2.0 })

a004 = [1.1, 2.2, 3.3, 4.4]
p a004.class
a004.filter! { |xb| xb > 2.0 }
p a004

a005 = [1.1, 2.2, 3.3, 4.4]
c005 = a005.filter! { |xb| xb > 2.0 }
p c005.class
p c005

# none removed on Float array -> nil
a006 = [1.1, 2.2, 3.3]
c006 = a006.filter! { |xb| xb > 0.0 }
p c006.class
p a006

p(["a", "bb", "ccc", "dddd"].filter! { |xc| xc.length > 2 })

a007 = ["a", "bb", "ccc", "dddd"]
p a007.class
a007.filter! { |xc| xc.length > 2 }
p a007

a008 = ["a", "bb", "ccc", "dddd"]
c008 = a008.filter! { |xc| xc.length > 2 }
p c008.class
p c008

# none removed on String array -> nil
a009 = ["a", "bb", "ccc"]
c009 = a009.filter! { |xc| xc.length > 0 }
p c009.class
p a009
