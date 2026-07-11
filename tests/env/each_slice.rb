# frozen_string_literal: true
# ENV.each_slice
ENV['ZZ_A'] = '1'
p ENV.each_slice(1).to_a.length > 0
x001 = ENV.each_slice(1).to_a; p x001.length > 0
