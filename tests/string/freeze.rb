# frozen_string_literal: true
# String#freeze
a205 = "hi"; p(a205.freeze.equal?(a205))
a206 = "hi"; c206 = (a206.freeze.equal?(a206)); p c206
a207 = "hi"; p(a207.frozen?)
# freeze returns the receiver and marks it frozen
a208 = "hi"; a208.freeze; p(a208.frozen?)
# freeze is idempotent
a209 = "hi".freeze; p(a209.freeze.frozen?)
# mutating a frozen string raises FrozenError
a210 = "hi".freeze; begin; a210 << "x"; p :nope; rescue FrozenError => e; p e.class; end
a211 = "hi".freeze; v211 = (begin; a211 << "x"; :nope; rescue FrozenError => e; e.class; end); p v211
a212 = "hi".freeze; begin; a212.concat("x"); rescue FrozenError => e; p e.class; end
# in-place transform methods (upcase!/downcase!/capitalize!/sub!/gsub!/reverse!) raise FrozenError on a frozen receiver
a213 = "hi".freeze; begin; a213.upcase!; p :nope; rescue FrozenError => e; p e.class; end
a216 = "hi".freeze; v216 = (begin; a216.upcase!; :nope; rescue FrozenError => e; e.class; end); p v216
# a frozen string is still readable and produces mutable derived strings
a214 = "hi".freeze; p(a214.upcase)
a215 = "hi".freeze; p(a215 + "!")
