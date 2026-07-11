# frozen_string_literal: true
# Kernel#methods
# p(Object.new.methods.is_a?(Array))              # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# m070 = Object.new.methods; p m070.is_a?(Array)  # WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
