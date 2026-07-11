# frozen_string_literal: true
# ENV.[]
ENV['ZZ_A'] = '1'
p ENV['ZZ_A']
a001 = ENV['ZZ_A']; p a001
ENV['ZZ_B'] = 'two'; b002 = 'ZZ_B'; p ENV[b002]
c003 = ENV['ZZ_B']; p c003
# missing key returns nil
p ENV['ZZ_NO_SUCH']
d004 = ENV['ZZ_NO_SUCH']; p d004
# a non-String (Symbol) key should raise TypeError; Spinel returns nil
e005 = (ENV[:sym] rescue $!.class); p e005
# an Integer key aborts C compilation
f006 = (ENV[5] rescue $!.class); p f006
# too many arguments should raise ArgumentError
g007 = (ENV['ZZ_A', 'ZZ_B'] rescue $!.class); p g007
