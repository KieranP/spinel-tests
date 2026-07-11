# frozen_string_literal: true
# ENV.uniq
ENV['ZZ_A'] = '1'
p ENV.uniq.length > 0
x001 = ENV.uniq; p x001.length > 0
