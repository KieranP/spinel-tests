# frozen_string_literal: true
# ENV.one?
ENV['ZZ_A'] = '1'
p ENV.one? { |k, v| k == 'ZZ_A' }
b001 = ENV.one? { |k, v| k == 'ZZ_A' }; p b001
