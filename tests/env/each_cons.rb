# frozen_string_literal: true
# ENV.each_cons
ENV['ZZ_A'] = '1'
p ENV.each_cons(1).to_a.length > 0
x001 = ENV.each_cons(1).to_a; p x001.length > 0
