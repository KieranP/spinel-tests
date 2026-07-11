# frozen_string_literal: true
# ENV.take_while
ENV['ZZ_A'] = '1'
p ENV.take_while { |k, v| false }.length
x001 = ENV.take_while { |k, v| false }; p x001.length
