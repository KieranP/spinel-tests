# frozen_string_literal: true
# Object#!~
p("hello" !~ /z/)
v001 = ("hello" !~ /z/); p v001
p("hello" !~ /e/)
v002 = ("hello" !~ /e/); p v002
a001 = "abc"; b001 = /x/; p(a001 !~ b001)
