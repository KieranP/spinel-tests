# frozen_string_literal: true
# TrueClass#singleton_methods / FalseClass#singleton_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.singleton_methods)    # Ruby []; Spinel raises NoMethodError (unsupported)
# p(false.singleton_methods)   # Ruby []; Spinel raises NoMethodError (unsupported)
