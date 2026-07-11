# frozen_string_literal: true
# ENV.slice_when
ENV['ZZ_A'] = '1'
p ENV.slice_when { |a, b| true }.to_a.length > 0
x001 = ENV.slice_when { |a, b| true }.to_a; p x001.length > 0
