# frozen_string_literal: true
# Time#>=

p (Time.utc(2020, 1, 1) >= Time.utc(2020, 6, 1))
p (Time.utc(2020, 6, 1) >= Time.utc(2020, 1, 1))
p (Time.utc(2020, 1, 1) >= Time.utc(2020, 1, 1))

a103 = Time.utc(2020, 1, 1)
b103 = Time.utc(2020, 6, 1)
p (a103 >= b103)
c103 = (a103 >= b103)
p c103.class
p c103
