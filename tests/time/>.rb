# frozen_string_literal: true
# Time#>

p (Time.utc(2020, 1, 1) > Time.utc(2020, 6, 1))
p (Time.utc(2020, 6, 1) > Time.utc(2020, 1, 1))
p (Time.utc(2020, 1, 1) > Time.utc(2020, 1, 1))

a101 = Time.utc(2020, 1, 1)
b101 = Time.utc(2020, 6, 1)
p (a101 > b101)
c101 = (a101 > b101)
p c101.class
p c101
