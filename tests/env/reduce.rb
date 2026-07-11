# frozen_string_literal: true
# ENV.reduce
ENV['ZZ_A'] = '1'
x001 = ENV.reduce(0) { |a, kv| a + 1 }; p x001 > 0
# operating on the result inline aborts compilation
p ENV.reduce(0) { |a, kv| a + 1 } > 0
