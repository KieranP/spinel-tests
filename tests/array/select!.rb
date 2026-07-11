# frozen_string_literal: true
# Array#select!
p([1, 2, 3, 4].select! { |xa| xa.even? })

a001 = [1, 2, 3, 4]
p a001.class
p a001.select! { |xa| xa.even? }

a002 = [1, 2, 3, 4]
c002 = a002.select! { |xa| xa.even? }
p c002.class
p c002

p([1.1, 2.2, 3.3, 4.4].select! { |xb| xb > 2.0 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p a003.select! { |xb| xb > 2.0 }

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = a004.select! { |xb| xb > 2.0 }
p c004.class
p c004

p(["a", "bb", "ccc", "dddd"].select! { |xc| xc.length > 2 })

a005 = ["a", "bb", "ccc", "dddd"]
p a005.class
p a005.select! { |xc| xc.length > 2 }

a006 = ["a", "bb", "ccc", "dddd"]
c006 = a006.select! { |xc| xc.length > 2 }
p c006.class
p c006

# no-change (all kept) returns nil
p([2, 4, 6].select! { |xd| xd.even? })
a007 = [2, 4, 6]; c007 = a007.select! { |xd| xd.even? }; p c007
