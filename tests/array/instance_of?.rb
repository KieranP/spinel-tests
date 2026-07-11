# frozen_string_literal: true
# Array#instance_of?
p([1, 2, 3].instance_of?(Array))
p([1, 2, 3].instance_of?(String))
a018 = [1, 2, 3]; p(a018.instance_of?(Array))
a019 = [1, 2, 3]; v019 = a019.instance_of?(String); p v019
