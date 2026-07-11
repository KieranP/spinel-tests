# frozen_string_literal: true
# ENV.drop
ENV['ZZ_A'] = '1'
p ENV.drop(0).length > 0
x001 = ENV.drop(0); p x001.length > 0
