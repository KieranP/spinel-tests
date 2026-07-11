# frozen_string_literal: true
# Time#sunday?

a001 = Time.utc(2026, 7, 19)
p a001.sunday?
b002 = Time.utc(2026, 7, 19)
c002 = b002.sunday?
p c002
