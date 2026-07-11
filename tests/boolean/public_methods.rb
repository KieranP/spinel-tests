# frozen_string_literal: true
# TrueClass#public_methods / FalseClass#public_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.public_methods.is_a?(Array))    # Ruby true; Spinel raises NoMethodError (unsupported)
# p(false.public_methods.is_a?(Array))   # Ruby true; Spinel raises NoMethodError (unsupported)
