# frozen_string_literal: true
# Enumerator#object_id
p([1, 2, 3].each.object_id.is_a?(Integer))
a024 = [1, 2, 3].each; p(a024.object_id == a024.object_id)
a025 = [1, 2, 3].each; v025 = (a025.object_id.is_a?(Integer)); p v025
