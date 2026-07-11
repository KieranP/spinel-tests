# frozen_string_literal: true
# NilClass#__send__
p(nil.__send__(:to_s))
p(nil.__send__(:nil?))
n001 = nil; p(n001.__send__(:to_a))
n002 = nil; v001 = n002.__send__(:to_i); p v001
