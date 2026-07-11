# frozen_string_literal: true
# TrueClass#private_methods / FalseClass#private_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.private_methods.is_a?(Array))    # Ruby true; Spinel raises NoMethodError (unsupported)
# p(false.private_methods.is_a?(Array))   # Ruby true; Spinel raises NoMethodError (unsupported)
