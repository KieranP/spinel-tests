# frozen_string_literal: true
# ENV.replace
ENV['ZZ_A'] = '1'
ENV.replace('ZZ_A' => '9'); p ENV['ZZ_A']
r001 = (ENV.replace('ZZ_A' => '9') rescue $!.class); p ENV['ZZ_A']
p ENV.replace('ZZ_C' => 'x').class
rc901 = ENV.replace('ZZ_C' => 'x').class; p rc901
