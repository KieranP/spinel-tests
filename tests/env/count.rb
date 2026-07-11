# frozen_string_literal: true
# ENV.count
ENV['ZZ_A'] = '1'
# count with no block, measured as a delta to avoid environment-size dependence
before001 = ENV.count; ENV['ZZ_CNT'] = 'x'; p (ENV.count - before001)
# count with a block should count only matching entries; Spinel ignores the block
p ENV.count { |k, v| k == 'ZZ_A' }
c002 = (ENV.count { |k, v| k == 'ZZ_A' }); p c002
# count(item) — Enumerable form counting matching pairs
p ENV.count(['ZZ_A', '1'])
