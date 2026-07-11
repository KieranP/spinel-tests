# frozen_string_literal: true
# Proc#ruby2_keywords
# WONTFIX: See docs/limitations.md - "By design — Proc#ruby2_keywords"
# a001 = proc { |*a| a }; a001.ruby2_keywords; p(a001.call(1, 2))
# b001 = proc { |*a| a }; v001 = b001.ruby2_keywords; p(v001.class)
