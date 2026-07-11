# frozen_string_literal: true
# ENV.clear
ENV['ZZ_A'] = '1'
ENV.clear; p ENV['ZZ_A']
ENV['ZZ_B'] = '1'; c001 = (ENV.clear rescue $!.class); p ENV['ZZ_B']
p ENV.clear.class
rc901 = ENV.clear.class; p rc901
