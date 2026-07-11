# frozen_string_literal: true
# Symbol#instance_of?
p(:abc.instance_of?(Symbol))
p(:abc.instance_of?(String))
a018 = :abc; p(a018.instance_of?(Symbol))
a019 = :abc; v019 = a019.instance_of?(String); p v019
