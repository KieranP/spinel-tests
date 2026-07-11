# frozen_string_literal: true
# String#object_id
p("abc".object_id.is_a?(Integer))
a024 = "abc"; p(a024.object_id == a024.object_id)
a025 = "abc"; v025 = (a025.object_id.is_a?(Integer)); p v025
