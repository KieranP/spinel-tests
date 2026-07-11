# frozen_string_literal: true
# ENV.find_all
ENV['ZZ_A'] = '1'
p ENV.find_all { |k, v| k == 'ZZ_A' }.length
x001 = ENV.find_all { |k, v| k == 'ZZ_A' }; p x001.length
