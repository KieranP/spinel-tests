# frozen_string_literal: true
# NilClass#public_send
p(nil.public_send(:to_s))
p(nil.public_send(:to_a))
p(nil.public_send(:nil?))
n001 = nil; p(n001.public_send(:to_i))
n002 = nil; v001 = n002.public_send(:inspect); p v001
