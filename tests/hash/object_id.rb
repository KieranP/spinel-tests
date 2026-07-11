# frozen_string_literal: true
# Hash#object_id
p({ a: 1 }.object_id.is_a?(Integer))
a024 = { a: 1 }; p(a024.object_id == a024.object_id)
a025 = { a: 1 }; v025 = (a025.object_id.is_a?(Integer)); p v025
