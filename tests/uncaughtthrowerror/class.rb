# frozen_string_literal: true
# UncaughtThrowError#class  (UncaughtThrowError < ArgumentError < StandardError)
e001 = (throw :x, 5 rescue $!); p e001.class
c002 = (throw :x, 5 rescue $!).class; p c002

# class name via Module#name and Module#to_s
e003 = (throw :x rescue $!); p e003.class.name
p e003.class.to_s

# the class constant reports its ancestry correctly
p(UncaughtThrowError.superclass)
p(ArgumentError.superclass)

# ...but reading #superclass off an instance's #class collapses to Object
e004 = (throw :x rescue $!); p e004.class.superclass
s005 = (throw :x rescue $!).class.superclass; p s005
