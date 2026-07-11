# frozen_string_literal: true
# ENV.values
ENV['ZZ_A'] = 'zzv'
p ENV.values.include?('zzv')
v001 = ENV.values; p v001.include?('zzv')
# a deleted key's value drops out; every value is a String
ENV.delete('ZZ_A'); p ENV.values.include?('zzv')
ENV['ZZ_B'] = 'zzw'; p ENV.values.all? { |v| v.is_a?(String) }
