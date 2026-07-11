# frozen_string_literal: true
# TrueClass#instance_variable_set / FalseClass#instance_variable_set
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.instance_variable_set(:@x, 5))    # Ruby FrozenError; Spinel raises NoMethodError (unsupported)
# p(false.instance_variable_set(:@x, 5))   # Ruby FrozenError; Spinel raises NoMethodError (unsupported)
