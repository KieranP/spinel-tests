# frozen_string_literal: true
# String#<<
p((+"ab") << "c")
a010 = +"ab"; a010 << "c"; p a010
a011 = +"ab"; b011 = +"c"; a011 << b011; p a011
a012 = +"ab"; b012 = +"c"; c012 = (a012 << b012); p c012
# chained appends
a013 = +"a"; a013 << (+"b") << "c"; p a013
# append an Integer codepoint
a014 = +"ab"; a014 << 99; p a014
a015 = +"ab"; b015 = 99; a015 << b015; p a015
# mutation is visible; Ruby returns the receiver itself (equal? true)
a016 = +"a"; p((a016 << "b").equal?(a016))
a017 = +"a"; v017 = ((a017 << "b").equal?(a017)); p v017
# a negative Integer is an invalid codepoint -> RangeError
a018 = +"a"; begin; a018 << -1; p :nope; rescue RangeError => e; p e.class; end
a019 = +"a"; v019 = (begin; a019 << -1; :nope; rescue RangeError => e; e.class; end); p v019
a020 = +"hello"; a021 = a020; a020 << " world"; p a021
a022 = +"hello"; a023 = a022; a022 << " world"; v022 = (a022.equal?(a023)); p v022
# in-place << on a mutable string IS observed through a container-stored element
a024 = +"hi"; arr024 = [a024]; a024 << "!"; p arr024
a025 = +"hi"; h025 = {k: a025}; a025 << "!"; v025 = h025; p v025
z001 = +"ab"; v001 = (z001 << 99); p v001
# discarding the result of the same append compiles and matches
z002 = +"ab"; z002 << 99; p z002
# the `a018 << -1` probe above answers 0 instead of raising RangeError
z018 = { a: +"abc" }; a018 = z018[:a]; a018 << "Z"; p z018
z019 = { a: +"abc" }; a019 = z019[:a]; v019 = (a019 << "Z"); p [z019, v019]
