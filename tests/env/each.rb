# frozen_string_literal: true
# ENV.each
ENV['ZZ_A'] = '1'
n001 = 0; ENV.each { |k, v| n001 += 1 }; p (n001 > 0)
seen002 = false; ENV.each { |k, v| seen002 = true if k == 'ZZ_A' }; p seen002
# the paired value is visible in the block
val003 = nil; ENV.each { |k, v| val003 = v if k == 'ZZ_A' }; p val003
