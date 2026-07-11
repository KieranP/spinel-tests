# frozen_string_literal: true
# ENV.find_index
ENV['ZZ_A'] = '1'
# the index is environment-dependent, so only its type is asserted
p ENV.find_index { |k, v| k == 'ZZ_A' }.is_a?(Integer)
x001 = ENV.find_index { |k, v| k == 'ZZ_A' }; p x001.is_a?(Integer)
