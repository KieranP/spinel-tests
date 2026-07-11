# frozen_string_literal: true
# Math.expm1

# p(Math.expm1(0))
# a001 = Math.expm1(0)
# p a001

# p(Math.expm1(1).round(12))
# a002 = Math.expm1(1)
# p a002.class
# p a002.round(12)

# p(Math.expm1(0.0))
# p(Math.expm1(-1).round(12))
# p(Math.expm1(2).round(12))

## argument in a variable
# b003 = 3
# p(Math.expm1(b003).round(12))
# c003 = Math.expm1(b003)
# p c003.round(12)

## the point of expm1: accurate for tiny x where exp(x)-1 loses precision
# p(Math.expm1(1e-15))
# d004 = 1e-10
# p(Math.expm1(d004))
# e004 = Math.expm1(d004)
# p e004

# p(Math.expm1(-1e-15))

## special values
# p(Math.expm1(Float::INFINITY))
# p(Math.expm1(-Float::INFINITY))
# p(Math.expm1(Float::NAN))

## large negative saturates at -1.0
# p(Math.expm1(-1000))
# f005 = Math.expm1(-800.0)
# p f005

## coercion
# p(Math.expm1(Rational(0)))
# p(Math.expm1(Rational(1, 2)).round(12))

## non-numeric raises
# r006 = (Math.expm1("1") rescue $!.class); p r006
# r007 = (Math.expm1(nil) rescue $!.class); p r007
