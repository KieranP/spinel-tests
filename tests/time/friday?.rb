# frozen_string_literal: true
# Time#friday?

a001 = Time.utc(2026, 7, 17)
p a001.friday?
b002 = Time.utc(2026, 7, 17)
c002 = b002.friday?
p c002
