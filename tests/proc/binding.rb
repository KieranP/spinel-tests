# frozen_string_literal: true
# Proc#binding
# WONTFIX: See docs/limitations.md - "Fundamental limits — binding as an object"
# p(->(x) { x }.binding.class)
# a001 = ->(x) { x }; v001 = a001.binding; p(v001.class)
