# frozen_string_literal: true
require 'set'

# Set#object_id
p(Set[1, 2, 3].object_id.is_a?(Integer))
a024 = Set[1, 2, 3]; p(a024.object_id == a024.object_id)
a025 = Set[1, 2, 3]; v025 = (a025.object_id.is_a?(Integer)); p v025
