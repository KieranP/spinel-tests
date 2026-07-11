# frozen_string_literal: true
# Object#protected_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(Object.new.protected_methods.is_a?(Array))   # Ruby: true; Spinel: raises (unsupported)
