# frozen_string_literal: true
# Object#public_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p("x".public_methods.include?(:upcase))   # Ruby: true; Spinel: raises (unsupported)
