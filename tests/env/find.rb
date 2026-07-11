# frozen_string_literal: true
# ENV.find
ENV['ZZ_A'] = '1'
p ENV.find { |k, v| k == 'ZZ_A' }.length
x001 = ENV.find { |k, v| k == 'ZZ_A' }; p x001.length
