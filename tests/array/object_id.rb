# frozen_string_literal: true
# Array#object_id
p([1, 2, 3].object_id.is_a?(Integer))
a024 = [1, 2, 3]; p(a024.object_id == a024.object_id)
a025 = [1, 2, 3]; v025 = (a025.object_id.is_a?(Integer)); p v025
