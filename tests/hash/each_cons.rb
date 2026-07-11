# frozen_string_literal: true
# Hash#each_cons
# The block form is refused before any C is emitted, taking down the whole file.
o001 = []; { a: 1, b: 2, c: 3 }.each_cons(2) { |s001| o001 << s001 }; p o001
o002 = []; h002 = { a: 1, b: 2, c: 3 }; h002.each_cons(2) { |s002| o002 << s002 }; p o002

# The blockless enumerator compiles, then answers no method.
r003 = ({ a: 1, b: 2, c: 3 }.each_cons(2).to_a rescue $!.class); p r003
h004 = { a: 1, b: 2, c: 3 }; r004 = (h004.each_cons(2).to_a rescue $!.class); p r004
h005 = { a: 1, b: 2 }; n005 = 2; r005 = (h005.each_cons(n005).to_a rescue $!.class); p r005
