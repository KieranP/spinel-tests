# frozen_string_literal: true
# Array#rfind

p([1, 2, 3, 4].rfind { |x| x.even? })

a001 = [1, 2, 3, 4]
p a001.class
p(a001.rfind { |x| x.even? })

a002 = [1, 2, 3, 4]
p a002.class
c002 = (a002.rfind { |x| x.even? })
p c002.class
p c002

# Float receiver
p([1.1, 2.2, 3.3, 4.4].rfind { |x| x < 3.0 })

a003 = [1.1, 2.2, 3.3, 4.4]
p a003.class
p(a003.rfind { |x| x < 3.0 })

a004 = [1.1, 2.2, 3.3, 4.4]
c004 = (a004.rfind { |x| x < 3.0 })
p c004.class
p c004

# String receiver
p(["a", "bb", "ccc", "dd"].rfind { |x| x.size == 2 })

a005 = ["a", "bb", "ccc", "dd"]
p a005.class
p(a005.rfind { |x| x.size == 2 })

a006 = ["a", "bb", "ccc", "dd"]
c006 = (a006.rfind { |x| x.size == 2 })
p c006.class
p c006

# not-found -> nil
p([1, 2, 3].rfind { |x| x > 9 })

a007 = [1, 2, 3]
c007 = a007.rfind { |x| x > 9 }
p c007

# empty receiver -> nil
p([].rfind { |x| x > 0 })

c008 = [].rfind { |x| x > 0 }
p c008

# symbol-to-proc block
p([1, 2, 3, 4].rfind(&:even?))

a010 = [1, 2, 3, 4]
c010 = a010.rfind(&:even?)
p c010
