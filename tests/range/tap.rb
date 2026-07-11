# frozen_string_literal: true
# Range#tap
a010 = (1..3); p(a010.tap { |o| o }.equal?(a010))
a011 = (1..3); v011 = a011.tap { |o| o }; p(v011.equal?(a011))
