# frozen_string_literal: true
# Rational#object_id
p(Rational(1, 2).object_id.is_a?(Integer))
a024 = Rational(1, 2); p(a024.object_id == a024.object_id)
a025 = Rational(1, 2); v025 = (a025.object_id.is_a?(Integer)); p v025
