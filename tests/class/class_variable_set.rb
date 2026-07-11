# frozen_string_literal: true
class C001; @@x001 = 5; end

# Class#class_variable_set
# Rejected before codegen (unlike literal instance_variable_set, which works).
C001.class_variable_set(:@@y001, 9); p(C001.class_variable_get(:@@y001))
