# frozen_string_literal: true
# Kernel#instance_of?
p(Object.new.instance_of?(Object))
p(Object.new.instance_of?(String))
a018 = Object.new; p(a018.instance_of?(Object))
a019 = Object.new; v019 = a019.instance_of?(String); p v019
