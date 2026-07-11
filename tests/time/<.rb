# frozen_string_literal: true
# Time#<

p (Time.utc(2020, 1, 1) < Time.utc(2020, 6, 1))
p (Time.utc(2020, 6, 1) < Time.utc(2020, 1, 1))
p (Time.utc(2020, 1, 1) < Time.utc(2020, 1, 1))

a100 = Time.utc(2020, 1, 1)
b100 = Time.utc(2020, 6, 1)
p (a100 < b100)
c100 = (a100 < b100)
p c100.class
p c100

# Ordering against a non-Time raises ArgumentError in ruby, but aborts the C build.
r101 = (Time.utc(2020, 1, 1) < 5 rescue $!.class); p r101
