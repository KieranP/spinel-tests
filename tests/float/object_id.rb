# frozen_string_literal: true
# Float#object_id
p(1.5.object_id.is_a?(Integer))
a024 = 1.5; p(a024.object_id == a024.object_id)
a025 = 1.5; v025 = (a025.object_id.is_a?(Integer)); p v025
