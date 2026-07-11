# frozen_string_literal: true
# Integer#object_id
p(5.object_id.is_a?(Integer))
a024 = 5; p(a024.object_id == a024.object_id)
a025 = 5; v025 = (a025.object_id.is_a?(Integer)); p v025
