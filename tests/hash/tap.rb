# frozen_string_literal: true
# Hash#tap
a010 = { a: 1 }; p(a010.tap { |o| o }.equal?(a010))
a011 = { a: 1 }; v011 = a011.tap { |o| o }; p(v011.equal?(a011))
