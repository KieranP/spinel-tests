# frozen_string_literal: true
# Regexp#tap
a010 = /ab/; p(a010.tap { |o| o }.equal?(a010))
a011 = /ab/; v011 = a011.tap { |o| o }; p(v011.equal?(a011))
