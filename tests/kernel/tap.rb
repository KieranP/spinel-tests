# frozen_string_literal: true
# Kernel#tap
a010 = Object.new; p(a010.tap { |o| o }.equal?(a010))
a011 = Object.new; v011 = a011.tap { |o| o }; p(v011.equal?(a011))
p(5.tap { |x| x + 1 })
v012 = 5.tap { |x| x + 1 }; p v012
p("ab".tap { |s| s.upcase })
p([1, 2].tap { |a| a << 3 })
p({ a: 1 }.tap { |h| h[:b] = 2 })
p(nil.tap { |x| x })
v013 = [1, 2].tap { |a| a.clear }; p v013
