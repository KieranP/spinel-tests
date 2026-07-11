# frozen_string_literal: true
# ENV.take
ENV['ZZ_A'] = '1'
p ENV.take(1).length
x001 = ENV.take(1); p x001.length
