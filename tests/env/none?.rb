# frozen_string_literal: true
# ENV.none?
ENV['ZZ_A'] = '1'
p ENV.none? { |k, v| k == 'ZZ_NO_SUCH_KEY' }
b001 = ENV.none? { |k, v| k == 'ZZ_NO_SUCH_KEY' }; p b001
