# frozen_string_literal: true
# Range#instance_of?
p((1..3).instance_of?(Range))
p((1..3).instance_of?(String))
a018 = (1..3); p(a018.instance_of?(Range))
a019 = (1..3); v019 = a019.instance_of?(String); p v019
