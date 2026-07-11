# frozen_string_literal: true
# ENV.slice
ENV['ZZ_A'] = 'zzv'
p ENV.slice('ZZ_A').key?('ZZ_A')
s001 = ENV.slice('ZZ_A'); p s001
# printing the result directly aborts compilation
p ENV.slice('ZZ_A')
# a missing key is simply absent from the result; no args gives an empty hash
p ENV.slice('ZZ_A', 'ZZ_NO_SUCH').key?('ZZ_NO_SUCH')
p ENV.slice.empty?
r002 = (ENV.slice(:sym) rescue $!.class); p r002
