# frozen_string_literal: true
class C001; end

# Module#module_exec (alias of class_exec)
r001 = C001.module_exec(5) { |n001| n001 * 2 }; p r001
p(C001.module_exec(5) { |n001| n001 * 2 })
C001.module_exec { def hi; 3; end }; p(C001.new.hi)
