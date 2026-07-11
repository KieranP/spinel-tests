# frozen_string_literal: true
# ENV.select!
ENV['ZZ_A'] = '1'
ENV.select! { |k, v| k != 'ZZ_A' }; p ENV['ZZ_A']
ENV['ZZ_B'] = '1'; ENV.select! { |k, v| k != 'ZZ_B' }; p ENV['ZZ_B']
p ENV.select! { |k, v| true }.class
rc901 = ENV.select! { |k, v| true }.class; p rc901
