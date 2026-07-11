# frozen_string_literal: true
# UncaughtThrowError#is_a? / #kind_of?  (UncaughtThrowError < ArgumentError < StandardError < Exception)
e001 = (throw :x, 5 rescue $!)
p(e001.is_a?(UncaughtThrowError))
p(e001.is_a?(ArgumentError))
p(e001.is_a?(StandardError))
p(e001.is_a?(Exception))
p(e001.is_a?(RuntimeError))
r002 = e001.is_a?(ArgumentError); p r002

# kind_of? is the alias
p(e001.kind_of?(StandardError))
r003 = e001.kind_of?(ArgumentError); p r003
