# frozen_string_literal: true
# UncaughtThrowError#== (Exception#==) — compares class + internal (nil) message + backtrace
# same-class instances raised on the same line are equal (nil stored message, equal backtrace)
a001 = (throw :x, 1 rescue $!); b001 = (throw :x, 1 rescue $!); p(a001 == b001)
c001 = (a001 == b001); p c001

# different tag, same line: Ruby still equal (compares the nil stored message, not the tag)
a002 = (throw :x rescue $!); b002 = (throw :y rescue $!); p(a002 == b002)
c002 = (a002 == b002); p c002

# reflexive
a003 = (throw :x, 1 rescue $!); p(a003 == a003)
c003 = (a003 == a003); p c003

# not equal to a non-exception
a004 = (throw :x rescue $!); p(a004 == "uncaught throw :x")
c004 = (a004 == "uncaught throw :x"); p c004

# not equal to nil
a005 = (throw :x rescue $!); p(a005 == nil)
