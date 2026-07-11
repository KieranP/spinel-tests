# frozen_string_literal: true
# ENV.values_at
ENV['ZZ_A'] = 'zzv'; ENV['ZZ_B'] = 'zzw'
p ENV.values_at('ZZ_A', 'ZZ_B').include?('zzv')
v001 = ENV.values_at('ZZ_A'); p v001
# printing the result directly aborts compilation
p ENV.values_at('ZZ_A', 'ZZ_B')
# a missing key yields nil in that slot; no args gives an empty array
p ENV.values_at('ZZ_A', 'ZZ_NO_SUCH')
p ENV.values_at.length
r002 = (ENV.values_at(:sym) rescue $!.class); p r002
