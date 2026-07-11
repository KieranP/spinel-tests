# frozen_string_literal: true
# Object#methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p("x".methods.include?(:upcase))   # Ruby: true; Spinel: raises (unsupported)
# p(5.methods.include?(:succ))       # Ruby: true; Spinel: raises (unsupported)
