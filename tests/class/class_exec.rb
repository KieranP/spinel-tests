# frozen_string_literal: true
class C001; end

# Class#class_exec
r001 = C001.class_exec(5) { |n001| n001 * 2 }; p r001
p(C001.class_exec(5) { |n001| n001 * 2 })
# The method-defining block form is still rejected (class_eval's works):
C001.class_exec { def hi; 3; end }; p(C001.new.hi)
