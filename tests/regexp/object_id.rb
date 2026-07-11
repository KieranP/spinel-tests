# frozen_string_literal: true
# Regexp#object_id
p(/ab/.object_id.is_a?(Integer))
a024 = /ab/; p(a024.object_id == a024.object_id)
a025 = /ab/; v025 = (a025.object_id.is_a?(Integer)); p v025
