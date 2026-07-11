# frozen_string_literal: true
# Regexp#instance_of?
p(/ab/.instance_of?(Regexp))
p(/ab/.instance_of?(String))
a018 = /ab/; p(a018.instance_of?(Regexp))
a019 = /ab/; v019 = a019.instance_of?(String); p v019
