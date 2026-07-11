# frozen_string_literal: true
# Object#private_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(Object.new.private_methods.is_a?(Array))   # Ruby: true; Spinel: raises (unsupported)
