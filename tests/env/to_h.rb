# frozen_string_literal: true
# ENV.to_h
ENV['ZZ_A'] = 'zzv'
p ENV.to_h.key?('ZZ_A')
h001 = ENV.to_h; p h001.key?('ZZ_A')
# the value round-trips, and the block form maps each pair
p ENV.to_h['ZZ_A']
h002 = ENV.to_h { |k, v| [k, v] }; p h002['ZZ_A']
