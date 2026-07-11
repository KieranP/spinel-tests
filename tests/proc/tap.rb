# frozen_string_literal: true
# Proc#tap
a010 = ->(a) { a }; p(a010.tap { |o| o }.equal?(a010))
a011 = ->(a) { a }; v011 = a011.tap { |o| o }; p(v011.equal?(a011))
