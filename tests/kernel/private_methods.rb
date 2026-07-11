# frozen_string_literal: true
# Kernel#private_methods
# p(Object.new.private_methods.is_a?(Array))              # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# m072 = Object.new.private_methods; p m072.is_a?(Array)  # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
