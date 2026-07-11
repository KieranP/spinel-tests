# frozen_string_literal: true
# NilClass#send
p(nil.send(:to_s))
p(nil.send(:to_a))
p(nil.send(:nil?))
p(nil.send(:inspect))
n001 = nil; p(n001.send(:to_i))
n002 = nil; v001 = n002.send(:to_s); p v001
