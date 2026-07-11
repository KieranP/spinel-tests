# frozen_string_literal: true
# ENV.key
ENV['ZZ_UNIQ'] = 'ZZ_UNIQVAL'
k001 = ENV.key('ZZ_UNIQVAL'); p k001
# printing the result directly aborts compilation
p ENV.key('ZZ_UNIQVAL')
# a value that is not present returns nil under both
k002 = ENV.key('zz_no_such_value_at_all'); p k002
r003 = (ENV.key(:sym) rescue $!.class); p r003
