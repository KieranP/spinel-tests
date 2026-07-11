# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data — reflection (documented limitations: ~/spinel/docs/limitations.md "General reflection …")
a001 = Point.new(1, 2)
# Data members are not ordinary ivars in Ruby (instance_variables is []), but Spinel exposes [:@x, :@y]
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(a001.instance_variables)
# Ruby has no @x ivar on a Data (nil); Spinel resolves the member's struct offset (1)
p(a001.instance_variable_get(:@x))
r001 = a001.instance_variable_get(:@x); p r001
# the full inherited method-name list is stripped by DCE
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# p(a001.methods.include?(:x))
