# frozen_string_literal: true
# ENV.delete_if
ENV['ZZ_A'] = '1'
ENV.delete_if { |k, v| k == 'ZZ_A' }; p ENV['ZZ_A']
ENV['ZZ_B'] = '1'; ENV.delete_if { |k, v| k == 'ZZ_B' }; p ENV['ZZ_B']
p ENV.delete_if { |k, v| false }.class
rc901 = ENV.delete_if { |k, v| false }.class; p rc901
