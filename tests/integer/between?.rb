# frozen_string_literal: true
# Integer#between?
p(5.between?(1, 10))
a021 = 5; p(a021.between?(1, 10))
a022 = 5; b022 = 1; p(a022.between?(b022, 10))
a023 = 5; b023 = 1; c023 = (a023.between?(b023, 10)); p c023

p(5.between?(6, 10))
p(5.between?(1, 4))
p(5.between?(5, 5))
p(5.between?(5, 10))
p(5.between?(1, 5))
p(5.between?(1.5, 10.5))
p(5.between?(10, 1))
p((-5).between?(-10, 0))
p 50.between?(1, 2 ** 100)
a024 = 50; c024 = (a024.between?(1, 2 ** 100)); p c024
p((2 ** 100).between?(1, 2 ** 200))

p((2 ** 150).between?(1, 2 ** 100))
p((2 ** 150).between?(2 ** 100, 2 ** 200))
p((10 ** 40).between?(10 ** 39, 10 ** 41))
a025 = (2 ** 150); c025 = (a025.between?(2 ** 100, 2 ** 200)); p c025
# Float bounds work under both:
p(2.between?(1, 3.0))
v026 = 2.between?(1, 3.0); p v026
r027 = (2.between?(1, Rational(5, 2)) rescue $!.class); p r027

# Integer#between? with String bounds (Ruby raises ArgumentError)
r880 = (5.between?("a", "z") rescue $!.class); p r880

# Integer#between? with a nil bound (Ruby raises ArgumentError)
r881 = (5.between?(nil, 9) rescue $!.class); p r881
