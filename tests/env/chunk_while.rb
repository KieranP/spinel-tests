# frozen_string_literal: true
# ENV.chunk_while
ENV['ZZ_A'] = '1'
p ENV.chunk_while { |a, b| true }.to_a.length > 0
x001 = ENV.chunk_while { |a, b| true }.to_a; p x001.length > 0
