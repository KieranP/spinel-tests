# frozen_string_literal: true
# ENV.shift
ENV['ZZ_A'] = '1'
# shift returns a [key, value] pair (length 2); the raw pair is environment-dependent
x001 = ENV.shift; p x001.length
before002 = ENV.size; ENV.shift; p (ENV.size == before002 - 1)
