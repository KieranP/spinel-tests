# frozen_string_literal: true
# ENV.detect
ENV['ZZ_A'] = '1'
p ENV.detect { |k, v| k == 'ZZ_A' }.length
x001 = ENV.detect { |k, v| k == 'ZZ_A' }; p x001.length
