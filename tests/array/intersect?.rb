# frozen_string_literal: true
# Array#intersect?
p([1, 2, 3].intersect?([3, 4]))

a020 = [1, 2, 3]
p a020.class
p a020.intersect?([3, 4])

a021 = [1, 2, 3]
b021 = [3, 4]
p b021.class
p a021.intersect?(b021)

a022 = [1, 2, 3]
b022 = [3, 4]
c022 = a022.intersect?(b022)
p c022.class
p c022

p([1.1, 2.2, 3.3].intersect?([2.2, 4.4]))

a023 = [1.1, 2.2, 3.3]
p a023.class
p a023.intersect?([2.2, 4.4])

a024 = [1.1, 2.2, 3.3]
b024 = [2.2, 4.4]
p b024.class
p a024.intersect?(b024)

a025 = [1.1, 2.2, 3.3]
b025 = [2.2, 4.4]
c025 = a025.intersect?(b025)
p c025.class
p c025

p(["a", "b", "c"].intersect?(["x", "y"]))

a026 = ["a", "b", "c"]
p a026.class
p a026.intersect?(["x", "y"])

a027 = ["a", "b", "c"]
b027 = ["x", "y"]
p b027.class
p a027.intersect?(b027)

a028 = ["a", "b", "c"]
b028 = ["x", "y"]
c028 = a028.intersect?(b028)
p c028.class
p c028
