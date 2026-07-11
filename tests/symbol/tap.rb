# frozen_string_literal: true
# Symbol#tap
a010 = :abc; p(a010.tap { |o| o }.equal?(a010))
a011 = :abc; v011 = a011.tap { |o| o }; p(v011.equal?(a011))
