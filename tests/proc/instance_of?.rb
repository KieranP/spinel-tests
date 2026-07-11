# frozen_string_literal: true
# Proc#instance_of?
p(->(a) { a }.instance_of?(Proc))
p(->(a) { a }.instance_of?(String))
a018 = ->(a) { a }; p(a018.instance_of?(Proc))
a019 = ->(a) { a }; v019 = a019.instance_of?(String); p v019
