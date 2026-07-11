# frozen_string_literal: true
class C001; @@a001 = 1; @@b001 = 2; end

# Class#class_variables
p(C001.class_variables.sort)
v001 = C001.class_variables; p v001.sort
