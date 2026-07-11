# frozen_string_literal: true
# ENV.store
ENV['ZZ_A'] = '1'
# store (alias of []=) is unimplemented: raises NoMethodError at run time
ENV.store('ZZ_A', '9'); p ENV['ZZ_A']
s001 = ENV.store('ZZ_A', '9'); p s001
# printing the result directly aborts compilation
p ENV.store('ZZ_A', '9')
