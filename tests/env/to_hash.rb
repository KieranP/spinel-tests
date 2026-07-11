# frozen_string_literal: true
# ENV.to_hash
ENV['ZZ_A'] = 'zzv'
p ENV.to_hash.key?('ZZ_A')
h001 = ENV.to_hash; p h001.key?('ZZ_A')
