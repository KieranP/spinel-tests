# frozen_string_literal: true
class C001; end
C001.class_eval { def hi; 7; end }

# Class#class_eval (block form, used for its side effect of defining a method)
o001 = C001.new
p(o001.hi)
v001 = o001.hi; p v001
r001 = C001.class_eval { 40 + 2 }; p r001
p(C001.class_eval { 40 + 2 })
