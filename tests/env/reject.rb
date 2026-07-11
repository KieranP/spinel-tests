# frozen_string_literal: true
# ENV.reject
ENV['ZZ_A'] = 'zzv'
p ENV.reject { |k, v| k != 'ZZ_A' }.key?('ZZ_A')
r001 = ENV.reject { |k, v| k != 'ZZ_A' }; p r001.key?('ZZ_A')
# the rejected key is absent, and the kept value is preserved
ENV['ZZ_B'] = 'zzw'
p ENV.reject { |k, v| k == 'ZZ_A' }.key?('ZZ_A')
r002 = ENV.reject { |k, v| k != 'ZZ_A' }; p r002['ZZ_A']
