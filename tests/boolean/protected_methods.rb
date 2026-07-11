# frozen_string_literal: true
# TrueClass#protected_methods / FalseClass#protected_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.protected_methods)    # Ruby []; Spinel raises NoMethodError (unsupported)
# p(false.protected_methods)   # Ruby []; Spinel raises NoMethodError (unsupported)
