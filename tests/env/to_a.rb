# frozen_string_literal: true
# ENV.to_a
ENV['ZZ_A'] = 'zzv'
p ENV.to_a.include?(['ZZ_A', 'zzv'])
a001 = ENV.to_a; p a001.include?(['ZZ_A', 'zzv'])
