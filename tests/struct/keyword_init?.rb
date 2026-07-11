# frozen_string_literal: true
Point = Struct.new(:x, :y)
KW = Struct.new(:x, :y, keyword_init: true)

# Struct.keyword_init?
p(KW.keyword_init?)
v1 = KW.keyword_init?; p(v1)
p(Point.keyword_init?)
