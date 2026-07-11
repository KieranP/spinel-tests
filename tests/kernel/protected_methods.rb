# frozen_string_literal: true
# Kernel#protected_methods
# p(Object.new.protected_methods.is_a?(Array))              # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# m073 = Object.new.protected_methods; p m073.is_a?(Array)  # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
