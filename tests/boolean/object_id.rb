# frozen_string_literal: true
# TrueClass#object_id
p(true.object_id.is_a?(Integer))
a024 = true; p(a024.object_id == a024.object_id)
a025 = true; v025 = (a025.object_id.is_a?(Integer)); p v025

# FalseClass#object_id
p(false.object_id.is_a?(Integer))
a069 = false; p(a069.object_id == a069.object_id)
a070 = false; v070 = (a070.object_id.is_a?(Integer)); p v070
