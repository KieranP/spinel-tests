# frozen_string_literal: true
# ENV.grep
ENV['ZZ_A'] = '1'
# every entry is a [key, value] Array, so grep(Array) matches all of them
p ENV.grep(Array).length > 0
x001 = ENV.grep(Array); p x001.length > 0
