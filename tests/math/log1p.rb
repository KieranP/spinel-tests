# frozen_string_literal: true
# Math.log1p

# p(Math.log1p(0))
# a001 = Math.log1p(0)
# p a001

# p(Math.log1p(1).round(12))
# a002 = Math.log1p(1)
# p a002.class
# p a002.round(12)

# p(Math.log1p(0.0))
# p(Math.log1p(Math::E - 1).round(12))

## argument in a variable
# b003 = 2
# p(Math.log1p(b003).round(12))
# c003 = Math.log1p(b003)
# p c003.round(12)

## the point of log1p: accurate for tiny x where log(1+x) loses precision
# p(Math.log1p(1e-15))
# d004 = 1e-10
# p(Math.log1p(d004))
# e004 = Math.log1p(d004)
# p e004

# p(Math.log1p(-1e-15))

## x == -1 is the pole
# p(Math.log1p(-1))
# p(Math.log1p(-1.0))

## x < -1 is a domain error
# r005 = (Math.log1p(-2) rescue $!.class); p r005
# r006 = (Math.log1p(-1.5) rescue $!.class); p r006

## special values
# p(Math.log1p(Float::INFINITY))
# p(Math.log1p(Float::NAN))

## coercion
# p(Math.log1p(Rational(0)))
# p(Math.log1p(Rational(1, 2)).round(12))

## Bignum argument is truncated to a machine int
# p(Math.log1p(2**100).round(12))

## non-numeric raises
# r007 = (Math.log1p("1") rescue $!.class); p r007
# r008 = (Math.log1p(nil) rescue $!.class); p r008
