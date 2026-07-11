# frozen_string_literal: true
# ENV.has_value?
ENV['ZZ_A'] = 'zzv'
p ENV.has_value?('zzv')
b001 = ENV.has_value?('zzv'); p b001
p ENV.has_value?('no_such_value_zz')
