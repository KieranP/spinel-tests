# frozen_string_literal: true
# Time#tuesday?

a001 = Time.utc(2026, 7, 21)
p a001.tuesday?
b002 = Time.utc(2026, 7, 21)
c002 = b002.tuesday?
p c002
