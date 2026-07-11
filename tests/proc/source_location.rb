# frozen_string_literal: true
# Proc#source_location
p(->(x) { x }.source_location.is_a?(Array))
a001 = ->(x) { x }; v001 = a001.source_location; p(v001.is_a?(Array))
