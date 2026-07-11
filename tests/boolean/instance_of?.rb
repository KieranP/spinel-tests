# frozen_string_literal: true
# TrueClass#instance_of?
p(true.instance_of?(TrueClass))
p(true.instance_of?(String))
a018 = true; p(a018.instance_of?(TrueClass))
a019 = true; v019 = a019.instance_of?(String); p v019

# FalseClass#instance_of?
p(false.instance_of?(FalseClass))
p(false.instance_of?(String))
a063 = false; p(a063.instance_of?(FalseClass))
a064 = false; v064 = a064.instance_of?(String); p v064
