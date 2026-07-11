# frozen_string_literal: true
# TrueClass#instance_variables / FalseClass#instance_variables
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.instance_variables)    # Ruby []; Spinel raises NoMethodError (unsupported)
# p(false.instance_variables)   # Ruby []; Spinel raises NoMethodError (unsupported)
