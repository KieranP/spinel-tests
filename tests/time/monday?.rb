# frozen_string_literal: true
# Time#monday?

a001 = Time.utc(2026, 7, 20)
p a001.monday?
b002 = Time.utc(2026, 7, 20)
c002 = b002.monday?
p c002
