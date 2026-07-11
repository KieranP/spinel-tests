# frozen_string_literal: true
# ENV.filter
ENV['ZZ_A'] = 'zzv'
p ENV.filter { |k, v| k == 'ZZ_A' }.key?('ZZ_A')
f001 = ENV.filter { |k, v| k == 'ZZ_A' }; p f001.key?('ZZ_A')
