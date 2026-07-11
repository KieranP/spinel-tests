# frozen_string_literal: true
# ENV.each_with_object
ENV['ZZ_A'] = '1'
p ENV.each_with_object([]) { |kv, a| a << kv[0] }.include?('ZZ_A')
x001 = ENV.each_with_object([]) { |kv, a| a << kv[0] }; p x001.include?('ZZ_A')
