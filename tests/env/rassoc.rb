# frozen_string_literal: true
# ENV.rassoc
ENV['ZZ_A'] = 'zz_rassoc_val'
p ENV.rassoc('zz_rassoc_val').is_a?(Array)
r001 = ENV.rassoc('zz_rassoc_val'); p r001
# printing the result directly aborts compilation
p ENV.rassoc('zz_rassoc_val')
