# frozen_string_literal: true
# String#empty?
p("".empty?)
p("x".empty?)
a001 = +""; p(a001.empty?)
a002 = +"abc"; p(a002.empty?)
a003 = +""; v003 = a003.empty?; p v003
a004 = +"abc"; v004 = a004.empty?; p v004
# a string of whitespace is not empty
p(" ".empty?)
p("\n".empty?)
# a string emptied by clear is empty
a005 = +"abc"; a005.clear; p(a005.empty?)
