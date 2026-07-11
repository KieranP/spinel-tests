# frozen_string_literal: true
# Proc#object_id
p(->(a) { a }.object_id.is_a?(Integer))
a024 = ->(a) { a }; p(a024.object_id == a024.object_id)
a025 = ->(a) { a }; v025 = (a025.object_id.is_a?(Integer)); p v025
