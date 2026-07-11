# frozen_string_literal: true
# Kernel#public_methods
# p(Object.new.public_methods.is_a?(Array))              # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# m071 = Object.new.public_methods; p m071.is_a?(Array)  # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
