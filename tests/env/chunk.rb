# frozen_string_literal: true
# ENV.chunk
ENV['ZZ_A'] = '1'
p ENV.chunk { |k, v| k == 'ZZ_A' }.to_a.length > 0
x001 = ENV.chunk { |k, v| k == 'ZZ_A' }.to_a; p x001.length > 0
