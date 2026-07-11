# frozen_string_literal: true
class C001; @@a001 = 1; end

# Class#class_variable_defined?
p(C001.class_variable_defined?(:@@a001))
v001 = C001.class_variable_defined?(:@@a001); p v001
p(C001.class_variable_defined?(:@@z001))
