# frozen_string_literal: true
# Object#to_enum
e120 = [1, 2, 3].to_enum; p e120.next
a120 = [10, 20]; e121 = a120.to_enum; p e121.next; p e121.next
p((1..3).to_enum.next)
e122 = (1..3).to_enum; v120 = e122.next; p v120
