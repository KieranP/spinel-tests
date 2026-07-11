# frozen_string_literal: true
class C001; @@x001 = 5; end

# Class#class_variable_get
p(C001.class_variable_get(:@@x001))
v001 = C001.class_variable_get(:@@x001); p v001
