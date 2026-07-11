# frozen_string_literal: true
# Kernel#__id__ (alias of #object_id)
p(Object.new.__id__.is_a?(Integer))
a451 = Object.new; v451 = a451.__id__; p(v451.is_a?(Integer))
