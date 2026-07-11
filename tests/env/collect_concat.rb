# frozen_string_literal: true
# ENV.collect_concat
ENV['ZZ_A'] = '1'
p ENV.collect_concat { |k, v| [k] }.include?('ZZ_A')
x001 = ENV.collect_concat { |k, v| [k] }; p x001.include?('ZZ_A')
