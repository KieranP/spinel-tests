# frozen_string_literal: true
# Array#each_slice

p([1, 2, 3, 4, 5].each_slice(2).to_a)

a001 = [1, 2, 3, 4, 5]
p a001.class
p a001.each_slice(2).to_a

a002 = [1, 2, 3, 4, 5]
b002 = 2
p b002.class
p a002.each_slice(b002).to_a

a003 = [1, 2, 3, 4, 5]
b003 = 2
c003 = a003.each_slice(b003).to_a
p c003.class
p c003

p([1.1, 2.2, 3.3, 4.4, 5.5].each_slice(2).to_a)

a004 = [1.1, 2.2, 3.3, 4.4, 5.5]
p a004.class
p a004.each_slice(2).to_a

a005 = [1.1, 2.2, 3.3, 4.4, 5.5]
b005 = 2
p b005.class
p a005.each_slice(b005).to_a

a006 = [1.1, 2.2, 3.3, 4.4, 5.5]
b006 = 2
c006 = a006.each_slice(b006).to_a
p c006.class
p c006

p(["a", "b", "c", "d", "e"].each_slice(2).to_a)

a007 = ["a", "b", "c", "d", "e"]
p a007.class
p a007.each_slice(2).to_a

a008 = ["a", "b", "c", "d", "e"]
b008 = 2
p b008.class
p a008.each_slice(b008).to_a

a009 = ["a", "b", "c", "d", "e"]
b009 = 2
c009 = a009.each_slice(b009).to_a
p c009.class
p c009

# A value returned from a method with a `raise` branch loses much of its method
# table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_ae(oae)
  case oae
  when Integer then [1, 2, 3]
  when String  then [4, 5, 6]
  else raise ArgumentError, "no"
  end
end
rb_ae = (raisebr_ae("ab").each_slice(2).to_a rescue $!.class); p rb_ae

# As a method's implicit return value this yields a zero value of the receiver's
# type instead of the receiver itself.
def ir808(x808); x808.each_slice(1) { |s808| nil }; end
p ir808([1, 2])
v808 = ir808([1, 2]); p v808
# control: the same call with the result consumed explicitly
def ic808(y808); return y808.each_slice(1) { |s808| nil }; end
p ic808([1, 2])

# blockless -> Enumerator, uneven and over-long slice sizes, empty receiver
h151 = [1, 2, 3, 4, 5, 6, 7]
p h151.each_slice(3).to_a
w151 = h151.each_slice(3).to_a; p w151
p h151.each_slice(1).to_a
p h151.each_slice(10).to_a
p h151.each_slice(3).class
p h151.each_slice(3).map { |s152| s152.sum }
w152 = h151.each_slice(2).map { |s153| s153.size }; p w152
p([].each_slice(2).to_a)
p(%w[a b c].each_slice(2).to_a)
w153 = ([1, 2].each_slice(0).to_a rescue $!.class); p w153
