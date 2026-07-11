# frozen_string_literal: true
# Regexp#fixed_encoding?
p(/a/.fixed_encoding?)
a001 = /a/; p(a001.fixed_encoding?)
a002 = /a/; v002 = a002.fixed_encoding?; p v002
