# frozen_string_literal: true
# Array#keep_if
p([1, 2, 3, 4].keep_if { |n| n.even? })

a040 = [1, 2, 3, 4]
p a040.class
p a040.keep_if { |n| n.even? }

a041 = [1, 2, 3, 4]
c041 = a041.keep_if { |n| n.even? }
p c041.class
p c041

p([1.1, 2.2, 3.3, 4.4].keep_if { |n| n > 2.0 })

a042 = [1.1, 2.2, 3.3, 4.4]
p a042.class
p a042.keep_if { |n| n > 2.0 }

a043 = [1.1, 2.2, 3.3, 4.4]
c043 = a043.keep_if { |n| n > 2.0 }
p c043.class
p c043

p(["a", "b", "c", "d"].keep_if { |s| s > "b" })

a044 = ["a", "b", "c", "d"]
p a044.class
p a044.keep_if { |s| s > "b" }

a045 = ["a", "b", "c", "d"]
c045 = a045.keep_if { |s| s > "b" }
p c045.class
p c045
