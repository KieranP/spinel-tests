# frozen_string_literal: true
# Math.lgamma

# lgamma returns [log(|gamma(x)|), sign]. The sign and the structure match Ruby;
# the log-magnitude value can differ from CRuby by a few ULP because Spinel calls
# the system libm lgamma while CRuby ships its own implementation. That is
# special-function float noise, not a divergence — so the value probes below assert
# correctness to a 1e-9 tolerance (faithful and diffable) rather than the raw float.

# structure and sign (match exactly)
r001 = Math.lgamma(5)
p r001.class
p r001.length
p r001[1]

# integer points where the value also matches exactly
p(Math.lgamma(1))
p(Math.lgamma(2))

a002 = Math.lgamma(2)
p a002

# value correctness to a 1e-9 tolerance (robust to a few ULP of libm noise)
p((Math.lgamma(5)[0] - 3.1780538303479458).abs < 1e-9)
v005 = Math.lgamma(5)[0]; p((v005 - 3.1780538303479458).abs < 1e-9)
p((Math.lgamma(0.5)[0] - 0.5723649429247001).abs < 1e-9)
v050 = Math.lgamma(0.5)[0]; p((v050 - 0.5723649429247001).abs < 1e-9)
p((Math.lgamma(-0.5)[0] - 1.2655121234846454).abs < 1e-9)
b003 = 7
p((Math.lgamma(b003)[0] - 6.579251212010101).abs < 1e-9)

# sign at negative half-integers (magnitude is fine; sign matches)
p(Math.lgamma(-0.5)[1])
p(Math.lgamma(-1.5)[1])
p(Math.lgamma(-2.5)[1])

# gamma's poles: 0, -1, -2, ... => [Infinity, 1] in Ruby.
p(Math.lgamma(-1))
w001 = Math.lgamma(-1); p w001
p(Math.lgamma(-2))
p(Math.lgamma(-100))
# the pole at zero: the sign follows the sign of the zero
p(Math.lgamma(-0.0))
p(Math.lgamma(0))
