# frozen_string_literal: true
# ENV.merge!
ENV['ZZ_A'] = '1'
ENV.merge!('ZZ_A' => '9'); p ENV['ZZ_A']
ENV['ZZ_B'] = '1'; m001 = ENV.merge!('ZZ_B' => '9'); p ENV['ZZ_B']
p ENV.merge!('ZZ_C' => 'x').class
rc901 = ENV.merge!('ZZ_C' => 'x').class; p rc901
# multiple pairs at once
ENV.merge!('ZZ_D' => 'd', 'ZZ_E' => 'e'); p [ENV['ZZ_D'], ENV['ZZ_E']]
ENV['ZZ_F'] = 'old'; ENV.merge!('ZZ_F' => 'new') { |k, old, new| "#{old}/#{new}" } rescue nil; p ENV['ZZ_F']
