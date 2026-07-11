# frozen_string_literal: true
# ENV.select
ENV['ZZ_A'] = 'zzv'
p ENV.select { |k, v| k == 'ZZ_A' }.key?('ZZ_A')
s001 = ENV.select { |k, v| k == 'ZZ_A' }; p s001.key?('ZZ_A')
# a non-matching key is excluded, and the selected value is preserved
ENV['ZZ_B'] = 'zzw'
p ENV.select { |k, v| k == 'ZZ_A' }.key?('ZZ_B')
s002 = ENV.select { |k, v| k == 'ZZ_A' }; p s002['ZZ_A']
# filter is an alias of select
p ENV.filter { |k, v| k == 'ZZ_A' }.key?('ZZ_A')
