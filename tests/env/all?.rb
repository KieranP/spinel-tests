# frozen_string_literal: true
# ENV.all?
ENV['ZZ_A'] = '1'
p ENV.all? { |k, v| k.is_a?(String) }
b001 = ENV.all? { |k, v| k.is_a?(String) }; p b001
