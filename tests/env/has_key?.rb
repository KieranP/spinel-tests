# frozen_string_literal: true
# ENV.has_key?
ENV['ZZ_A'] = '1'
p ENV.has_key?('ZZ_A')
a001 = ENV.has_key?('ZZ_A'); p a001
b002 = 'ZZ_A'; p ENV.has_key?(b002)
p ENV.has_key?('ZZ_NO_SUCH')
c003 = ENV.has_key?('ZZ_NO_SUCH'); p c003
# a non-String (Symbol) key should raise TypeError; Spinel returns false
d004 = (ENV.has_key?(:sym) rescue $!.class); p d004
# wrong argument count should raise ArgumentError
e005 = (ENV.has_key? rescue $!.class); p e005
