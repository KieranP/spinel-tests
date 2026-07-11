# frozen_string_literal: true
# ENV.size
ENV['ZZ_A'] = '1'
# measured as a delta to avoid environment-size dependence
before001 = ENV.size; ENV['ZZ_SIZE'] = 'x'; p (ENV.size - before001)
b002 = ENV.size; p (b002 > 0)
