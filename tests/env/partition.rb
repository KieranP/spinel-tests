# frozen_string_literal: true
# ENV.partition
ENV['ZZ_A'] = '1'
p ENV.partition { |k, v| true }.length
x001 = ENV.partition { |k, v| true }; p x001.length
