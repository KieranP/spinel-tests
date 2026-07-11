# frozen_string_literal: true
# ENV.reverse_each
ENV['ZZ_A'] = '1'
p ENV.reverse_each.to_a.length > 0
x001 = ENV.reverse_each.to_a; p x001.length > 0
