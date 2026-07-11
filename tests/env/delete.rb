# frozen_string_literal: true
# ENV.delete
ENV['ZZ_A'] = 'zzv'; ENV.delete('ZZ_A'); p ENV['ZZ_A']
ENV['ZZ_B'] = 'x'; d001 = ENV.delete('ZZ_B'); p d001
# deleting a missing key returns nil
d002 = ENV.delete('ZZ_NO_SUCH'); p d002
# printing the result directly aborts compilation
p ENV.delete('ZZ_A')
# present key: block is NOT called, the deleted value is returned (matches under both)
ENV['ZZ_D'] = 'dv'; p ENV.delete('ZZ_D') { |k| "missing:#{k}" }
ENV['ZZ_E'] = 'ev'; d004 = ENV.delete('ZZ_E') { |k| "missing:#{k}" }; p d004
p ENV.delete('ZZ_NO_BLK') { |k| "missing:#{k}" }
d005 = ENV.delete('ZZ_NO_BLK') { |k| "missing:#{k}" }; p d005
