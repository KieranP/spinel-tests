# frozen_string_literal: true
# Time#<=

p (Time.utc(2020, 1, 1) <= Time.utc(2020, 6, 1))
p (Time.utc(2020, 6, 1) <= Time.utc(2020, 1, 1))
p (Time.utc(2020, 1, 1) <= Time.utc(2020, 1, 1))

a102 = Time.utc(2020, 1, 1)
b102 = Time.utc(2020, 6, 1)
p (a102 <= b102)
c102 = (a102 <= b102)
p c102.class
p c102
