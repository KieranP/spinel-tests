# frozen_string_literal: true
# ENV.flat_map
ENV['ZZ_A'] = '1'
p ENV.flat_map { |k, v| [k] }.include?('ZZ_A')
x001 = ENV.flat_map { |k, v| [k] }; p x001.include?('ZZ_A')
