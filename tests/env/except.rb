# frozen_string_literal: true
# ENV.except
ENV['ZZ_A'] = 'zzv'
p ENV.except('ZZ_A').key?('ZZ_A')
e001 = ENV.except('ZZ_A'); p e001.key?('ZZ_A')
# other keys are retained; a missing excluded key is a no-op
ENV['ZZ_B'] = 'zzw'
p ENV.except('ZZ_A').key?('ZZ_B')
p ENV.except('ZZ_NO_SUCH').key?('ZZ_B')
