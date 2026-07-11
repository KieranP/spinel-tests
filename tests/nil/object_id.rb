# frozen_string_literal: true
# NilClass#object_id
p(nil.object_id.is_a?(Integer))
a024 = nil; p(a024.object_id == a024.object_id)
a025 = nil; v025 = (a025.object_id.is_a?(Integer)); p v025
