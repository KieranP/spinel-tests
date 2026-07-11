# frozen_string_literal: true
# TrueClass#instance_variable_defined? / FalseClass#instance_variable_defined?
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.instance_variable_defined?(:@x))    # Ruby false; Spinel raises NoMethodError (unsupported)
# p(false.instance_variable_defined?(:@x))   # Ruby false; Spinel raises NoMethodError (unsupported)
