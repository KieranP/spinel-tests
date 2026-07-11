# frozen_string_literal: true
# TrueClass#instance_variable_get / FalseClass#instance_variable_get
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(true.instance_variable_get(:@x))    # Ruby nil; Spinel raises NoMethodError (unsupported)
# p(false.instance_variable_get(:@x))   # Ruby nil; Spinel raises NoMethodError (unsupported)
