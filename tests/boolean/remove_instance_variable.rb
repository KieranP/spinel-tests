# frozen_string_literal: true
# TrueClass#remove_instance_variable / FalseClass#remove_instance_variable
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.remove_instance_variable(:@x))    # Ruby FrozenError; Spinel raises NoMethodError (unsupported)
# p(false.remove_instance_variable(:@x))   # Ruby FrozenError; Spinel raises NoMethodError (unsupported)
