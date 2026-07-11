# frozen_string_literal: true
# ENV.group_by
ENV['ZZ_A'] = '1'
p ENV.group_by { |k, v| 1 }.length > 0
x001 = ENV.group_by { |k, v| 1 }; p x001.length > 0
