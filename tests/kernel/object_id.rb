# frozen_string_literal: true
# Kernel#object_id
p(Object.new.object_id.is_a?(Integer))
a024 = Object.new; p(a024.object_id == a024.object_id)
a025 = Object.new; v025 = (a025.object_id.is_a?(Integer)); p v025

# the same object answers the same id; two distinct objects do not
a026 = [1, 2]; p(a026.object_id == a026.object_id)
a027 = [1, 2]; b027 = [1, 2]; p(a027.object_id == b027.object_id)
o028 = Object.new; p(o028.__id__ == o028.object_id)
p(1.object_id == 1.object_id)
p(nil.object_id == nil.object_id)
v029 = [3].object_id.is_a?(Integer); p v029
