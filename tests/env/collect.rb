# frozen_string_literal: true
# ENV.collect
ENV['ZZ_A'] = '1'
p ENV.collect { |k, v| k }.include?('ZZ_A')
x001 = ENV.collect { |k, v| k }; p x001.include?('ZZ_A')
