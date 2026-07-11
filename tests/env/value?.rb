# frozen_string_literal: true
# ENV.value?
ENV['ZZ_A'] = 'zzv'
p ENV.value?('zzv')
b001 = ENV.value?('zzv'); p b001
p ENV.value?('no_such_value_zz')
