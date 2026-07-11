# frozen_string_literal: true
# Hash#each_slice
# The block form is refused before any C is emitted, taking down the whole file.
o001 = []; { a: 1, b: 2, c: 3 }.each_slice(2) { |s001| o001 << s001 }; p o001
o002 = []; h002 = { a: 1, b: 2, c: 3 }; h002.each_slice(2) { |s002| o002 << s002 }; p o002
h003 = { a: 1, b: 2, c: 3 }; n003 = 2; o003 = []; h003.each_slice(n003) { |s003| o003 << s003 }; p o003

# The blockless enumerator compiles, then answers no method.
r004 = ({ a: 1, b: 2, c: 3 }.each_slice(2).to_a rescue $!.class); p r004
h005 = { a: 1, b: 2, c: 3 }; r005 = (h005.each_slice(2).to_a rescue $!.class); p r005
h006 = { a: 1 }; n006 = 1; r006 = (h006.each_slice(n006).to_a rescue $!.class); p r006
r007 = ({}.each_slice(2).to_a rescue $!.class); p r007
