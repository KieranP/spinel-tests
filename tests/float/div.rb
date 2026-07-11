# frozen_string_literal: true
# Float#div (integer division — (self / other).floor, returns an Integer)
p(7.5.div(2))
r001 = (7.5.div(2)); p r001
a001 = 7.5; b001 = 2; r002 = (a001.div(b001) rescue $!.class); p r002
r003 = ((-7.5).div(2) rescue $!.class); p r003
r004 = (7.5.div(2.5) rescue $!.class); p r004
# division by zero raises ZeroDivisionError; div on Infinity raises FloatDomainError
r005 = (1.0.div(0) rescue $!.class); p r005
r006 = (Float::INFINITY.div(2) rescue $!.class); p r006
