# frozen_string_literal: true
# ENV.reject!
ENV['ZZ_A'] = '1'
ENV.reject! { |k, v| k == 'ZZ_A' }; p ENV['ZZ_A']
ENV['ZZ_B'] = '1'; ENV.reject! { |k, v| k == 'ZZ_B' }; p ENV['ZZ_B']
p ENV.reject! { |k, v| false }.class
rc901 = ENV.reject! { |k, v| false }.class; p rc901
