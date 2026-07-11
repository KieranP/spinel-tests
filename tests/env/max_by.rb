# frozen_string_literal: true
# ENV.max_by
ENV['ZZ_A'] = '1'
p ENV.max_by { |k, v| k }.length
x001 = ENV.max_by { |k, v| k }; p x001.length
