# frozen_string_literal: true
# ENV.[]=
ENV['ZZ_A'] = '1'; p ENV['ZZ_A']
# the []= expression evaluates to the wrong value under Spinel (the write still happens)
v001 = (ENV['ZZ_A'] = '9'); p v001
p ENV['ZZ_A']
# printing the []= result directly aborts compilation
p(ENV['ZZ_A'] = 'x')
# a non-String key or value raises TypeError under both
r002 = ((ENV['ZZ_A'] = 5) rescue $!.class); p r002
r003 = ((ENV['ZZ_B'] = :sym) rescue $!.class); p r003
# assigning nil deletes the key
ENV['ZZ_C'] = 'c'; ENV['ZZ_C'] = nil; p ENV['ZZ_C']
# an Integer key aborts C compilation
r005 = ((ENV[5] = 'x') rescue $!.class); p r005
