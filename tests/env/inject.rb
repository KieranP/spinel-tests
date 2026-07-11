# frozen_string_literal: true
# ENV.inject
ENV['ZZ_A'] = '1'
x001 = ENV.inject(0) { |a, kv| a + 1 }; p x001 > 0
# operating on the result inline aborts compilation
p ENV.inject(0) { |a, kv| a + 1 } > 0
