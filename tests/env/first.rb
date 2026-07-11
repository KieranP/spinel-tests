# frozen_string_literal: true
# ENV.first
ENV['ZZ_A'] = '1'
p ENV.first.length
x001 = ENV.first; p x001.length
# first(n) returns an Array of n pairs
p ENV.first(1).length
x002 = ENV.first(1); p x002.length
