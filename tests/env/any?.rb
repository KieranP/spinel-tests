# frozen_string_literal: true
# ENV.any?
ENV['ZZ_A'] = '1'
p ENV.any? { |k, v| k == 'ZZ_A' }
b001 = ENV.any? { |k, v| k == 'ZZ_A' }; p b001
