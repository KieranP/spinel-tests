# frozen_string_literal: true
# ENV.keep_if
ENV['ZZ_A'] = '1'
ENV.keep_if { |k, v| k != 'ZZ_A' }; p ENV['ZZ_A']
ENV['ZZ_B'] = '1'; ENV.keep_if { |k, v| k != 'ZZ_B' }; p ENV['ZZ_B']
p ENV.keep_if { |k, v| true }.class
rc901 = ENV.keep_if { |k, v| true }.class; p rc901
