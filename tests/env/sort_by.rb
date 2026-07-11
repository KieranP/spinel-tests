# frozen_string_literal: true
# ENV.sort_by
ENV['ZZ_A'] = '1'
p ENV.sort_by { |k, v| k }.length > 0
x001 = ENV.sort_by { |k, v| k }; p x001.length > 0
