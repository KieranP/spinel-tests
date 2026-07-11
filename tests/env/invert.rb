# frozen_string_literal: true
# ENV.invert
ENV['ZZ_A'] = 'zzv'
p ENV.invert.key?('zzv')
i001 = ENV.invert; p i001.key?('zzv')
