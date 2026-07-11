# frozen_string_literal: true
class C001; end
C001.module_eval { def hi; 7; end }

# Module#module_eval (block form, alias of class_eval)
o001 = C001.new
p(o001.hi)
v001 = o001.hi; p v001
r001 = C001.module_eval { 40 + 2 }; p r001
p(C001.module_eval { 40 + 2 })
