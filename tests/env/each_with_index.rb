# frozen_string_literal: true
# ENV.each_with_index
ENV['ZZ_A'] = '1'
p ENV.each_with_index.to_a.length > 0
x001 = ENV.each_with_index.to_a; p x001.length > 0
