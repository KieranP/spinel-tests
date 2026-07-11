# frozen_string_literal: true
# Integer#tap
a010 = 5; p(a010.tap { |o| o }.equal?(a010))
a011 = 5; v011 = a011.tap { |o| o }; p(v011.equal?(a011))
