# frozen_string_literal: true
# ENV.min_by
ENV['ZZ_A'] = '1'
p ENV.min_by { |k, v| k }.length
x001 = ENV.min_by { |k, v| k }; p x001.length
