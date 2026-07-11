# frozen_string_literal: true
# ENV.fetch
ENV['ZZ_A'] = '1'
p ENV.fetch('ZZ_A')
a001 = ENV.fetch('ZZ_A'); p a001
b002 = 'ZZ_A'; p ENV.fetch(b002)
p ENV.fetch('ZZ_NO', 'dflt')
c003 = ENV.fetch('ZZ_NO', 'dflt'); p c003
# missing key with no default raises KeyError
r004 = (ENV.fetch('ZZ_NO') rescue $!.class); p r004
# a block should be called for a missing key; Spinel ignores it and raises KeyError
r005 = (ENV.fetch('ZZ_NO') { |k| "m:#{k}" } rescue $!.class); p r005
# a non-String (Symbol) key should raise TypeError; Spinel raises KeyError
r006 = (ENV.fetch(:sym) rescue $!.class); p r006
# an Integer key aborts C compilation
r007 = (ENV.fetch(5) rescue $!.class); p r007
# wrong argument count should raise ArgumentError
r008 = (ENV.fetch('ZZ_A', 'd', 'x') rescue $!.class); p r008
r009 = (ENV.fetch rescue $!.class); p r009
# a block is ignored when the key is present
p ENV.fetch('ZZ_A') { 'blk' }
r010 = ENV.fetch('ZZ_A') { 'blk' }; p r010
