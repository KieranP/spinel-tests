# frozen_string_literal: true
# ENV.filter_map
ENV['ZZ_A'] = '1'
p ENV.filter_map { |k, v| k if k == 'ZZ_A' }.length
x001 = ENV.filter_map { |k, v| k if k == 'ZZ_A' }; p x001.length
