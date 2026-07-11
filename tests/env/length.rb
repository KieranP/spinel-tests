# frozen_string_literal: true
# ENV.length
ENV['ZZ_A'] = '1'
# measured as a delta to avoid environment-size dependence
before001 = ENV.length; ENV['ZZ_LEN'] = 'x'; p (ENV.length - before001)
b002 = ENV.length; p (b002 > 0)
