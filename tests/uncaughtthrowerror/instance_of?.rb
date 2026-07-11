# frozen_string_literal: true
# UncaughtThrowError#instance_of?
e001 = (throw :x, 5 rescue $!)
p(e001.instance_of?(UncaughtThrowError))
r002 = e001.instance_of?(UncaughtThrowError); p r002

# instance_of? is exact-class only, not ancestors
p(e001.instance_of?(ArgumentError))
p(e001.instance_of?(StandardError))
r003 = e001.instance_of?(ArgumentError); p r003
