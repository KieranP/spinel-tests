# frozen_string_literal: true
# ENV.each_value
ENV['ZZ_A'] = 'zzv'
# The each_value block-form crash is memory corruption whose firing depends on the
# ambient environment's size/layout; pad with enough entries to trigger it reliably.
300.times { |i| ENV["ZZ_PAD_#{i}"] = "padpadpadpadpadpad#{i}" }
n001 = 0; ENV.each_value { |v| n001 += 1 }; p (n001 > 0)
seen002 = false; ENV.each_value { |v| seen002 = true if v == 'zzv' }; p seen002
