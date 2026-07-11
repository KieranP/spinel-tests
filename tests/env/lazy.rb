# frozen_string_literal: true
# ENV.lazy
ENV['ZZ_A'] = '1'
p ENV.lazy.select { |k, v| k == 'ZZ_A' }.first(1).length
x001 = ENV.lazy.select { |k, v| k == 'ZZ_A' }.first(1); p x001.length
