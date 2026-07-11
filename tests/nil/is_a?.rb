# frozen_string_literal: true
# NilClass#is_a?
p(nil.is_a?(NilClass))
p(nil.is_a?(Object))
p(nil.is_a?(String))
a014 = nil; p(a014.is_a?(NilClass))
a015 = nil; v015 = a015.is_a?(String); p v015
# is_a? follows the ancestor chain (Kernel, BasicObject)
p(nil.is_a?(Kernel))
p(nil.is_a?(BasicObject))
p(nil.is_a?(Integer))
# receiver and class-argument both in variables
a016 = nil; k016 = Object; p(a016.is_a?(k016))
a017 = nil; k017 = NilClass; v017 = a017.is_a?(k017); p v017
