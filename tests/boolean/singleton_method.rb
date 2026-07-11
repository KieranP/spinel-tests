# frozen_string_literal: true
# TrueClass#singleton_method / FalseClass#singleton_method
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.singleton_method(:to_s))    # Ruby NameError; Spinel raises NoMethodError (unsupported)
# p(false.singleton_method(:to_s))   # Ruby NameError; Spinel raises NoMethodError (unsupported)
