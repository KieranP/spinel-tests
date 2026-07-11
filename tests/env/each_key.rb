# frozen_string_literal: true
# ENV.each_key
ENV['ZZ_A'] = '1'
n001 = 0; ENV.each_key { |k| n001 += 1 }; p (n001 > 0)
seen002 = false; ENV.each_key { |k| seen002 = true if k == 'ZZ_A' }; p seen002
