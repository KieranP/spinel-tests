# frozen_string_literal: true
# ENV.drop_while
ENV['ZZ_A'] = '1'
p ENV.drop_while { |k, v| false }.length > 0
x001 = ENV.drop_while { |k, v| false }; p x001.length > 0
