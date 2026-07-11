# frozen_string_literal: true
# TrueClass#methods / FalseClass#methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.methods.is_a?(Array))    # Ruby true; Spinel raises NoMethodError (unsupported)
# p(false.methods.is_a?(Array))   # Ruby true; Spinel raises NoMethodError (unsupported)
