# frozen_string_literal: true
# ENV.map
ENV['ZZ_A'] = '1'
p ENV.map { |k, v| k }.include?('ZZ_A')
m001 = ENV.map { |k, v| k }; p m001.include?('ZZ_A')
