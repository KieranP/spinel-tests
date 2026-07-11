# frozen_string_literal: true
# Regexp#encoding
p(/a/.encoding)
a001 = /a/; p(a001.encoding)
a002 = /a/; v002 = a002.encoding; p v002
