# frozen_string_literal: true
# ENV.key?
ENV['ZZ_A'] = '1'
p ENV.key?('ZZ_A')
a001 = ENV.key?('ZZ_A'); p a001
b002 = 'ZZ_A'; p ENV.key?(b002)
p ENV.key?('ZZ_NO_SUCH')
c003 = ENV.key?('ZZ_NO_SUCH'); p c003
# a non-String (Symbol) key should raise TypeError; Spinel returns false
d004 = (ENV.key?(:sym) rescue $!.class); p d004
# wrong argument count should raise ArgumentError
e005 = (ENV.key?('ZZ_A', 'ZZ_B') rescue $!.class); p e005
