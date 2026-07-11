# frozen_string_literal: true
# ENV.filter!
ENV['ZZ_A'] = '1'
ENV.filter! { |k, v| k != 'ZZ_A' }; p ENV['ZZ_A']
ENV['ZZ_B'] = '1'; ENV.filter! { |k, v| k != 'ZZ_B' }; p ENV['ZZ_B']
p ENV.filter! { |k, v| true }.class
rc901 = ENV.filter! { |k, v| true }.class; p rc901
