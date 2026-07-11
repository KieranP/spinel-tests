# frozen_string_literal: true
# Range#first
p((1..5).first(2))
a014 = (1..5); p(a014.first(2))
a015 = (1..5); b015 = 2; p(a015.first(b015))
a016 = (1..5); b016 = 2; c016 = (a016.first(b016)); p c016
p((1..5).first)
a017 = (1..5); c017 = (a017.first); p c017
p((1..5).first(0))
p((1..5).first(10))
p((1..).first(3))
p(("a".."e").first(2))
a018 = ("a".."e"); p(a018.first(2))

p((1..).first)
v019 = ((1..).first); p(v019)
p((5..1).first(2))
p((3..3).first(1))
p((1.0..5.0).first)
r020 = ((..5).first rescue $!.class); p r020
r021 = ((1..5).first(-1) rescue $!.class); p r021
r022 = (("a".."e").first(-1) rescue $!.class); p r022

# a mixed finite Float / Integer pair truncates the Float endpoint
p((1.5..5).first)
v023 = ((1.5..5).first); p v023
p((1.5..5.5).first)
