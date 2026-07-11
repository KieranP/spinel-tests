# frozen_string_literal: true
# Object#enum_for
p([1, 2, 3].enum_for(:each).next)
e123 = [1, 2, 3].enum_for(:each); p e123.next
a121 = [7, 8]; e124 = a121.enum_for(:each); v121 = e124.next; p v121
