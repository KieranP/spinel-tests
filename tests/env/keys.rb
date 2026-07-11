# frozen_string_literal: true
# ENV.keys
ENV['ZZ_A'] = 'zzv'
p ENV.keys.include?('ZZ_A')
k001 = ENV.keys; p k001.include?('ZZ_A')
# a deleted key drops out of keys; every key is a String
ENV.delete('ZZ_A'); p ENV.keys.include?('ZZ_A')
ENV['ZZ_B'] = 'x'; p ENV.keys.all? { |k| k.is_a?(String) }
