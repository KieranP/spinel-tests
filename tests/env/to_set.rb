# frozen_string_literal: true
# ENV.to_set
ENV['ZZ_A'] = '1'
p ENV.to_set.include?(['ZZ_A', '1'])
x001 = ENV.to_set; p x001.include?(['ZZ_A', '1'])
