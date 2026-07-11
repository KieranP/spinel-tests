# frozen_string_literal: true
# NilClass#tap
a010 = nil; p(a010.tap { |o| o }.equal?(a010))
a011 = nil; v011 = a011.tap { |o| o }; p(v011.equal?(a011))
