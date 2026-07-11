# frozen_string_literal: true
# Kernel.superclass (a Module has no #superclass -> NoMethodError)
r045 = (begin; Kernel.superclass; rescue NoMethodError; "nomethod"; end); p r045
