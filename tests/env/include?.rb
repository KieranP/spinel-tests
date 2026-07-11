# frozen_string_literal: true
# ENV.include?
ENV['ZZ_A'] = '1'
p ENV.include?('ZZ_A')
a001 = ENV.include?('ZZ_A'); p a001
b002 = 'ZZ_A'; p ENV.include?(b002)
p ENV.include?('ZZ_NO_SUCH')
c003 = ENV.include?('ZZ_NO_SUCH'); p c003
# a non-String (Symbol) key should raise TypeError; Spinel returns false
d004 = (ENV.include?(:sym) rescue $!.class); p d004
# wrong argument count should raise ArgumentError
e005 = (ENV.include?('ZZ_A', 'ZZ_B') rescue $!.class); p e005
