# frozen_string_literal: true
# ENV.assoc
ENV['ZZ_A'] = 'zzv'
p ENV.assoc('ZZ_A').is_a?(Array)
a001 = ENV.assoc('ZZ_A'); p a001
# printing the result directly aborts compilation
p ENV.assoc('ZZ_A')
# a missing key returns nil under both
b002 = ENV.assoc('ZZ_NO_SUCH'); p b002
r003 = (ENV.assoc(:sym) rescue $!.class); p r003
