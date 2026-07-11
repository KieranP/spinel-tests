# frozen_string_literal: true
# Hash#cycle
# Refused before any C is emitted, taking down the whole file.
o001 = []; { a: 1, b: 2 }.cycle(2) { |pr001| o001 << pr001 }; p o001
a002 = { a: 1, b: 2 }; o002 = []; a002.cycle(2) { |pr002| o002 << pr002 }; p o002
a003 = { a: 1 }; n003 = 3; o003 = []; a003.cycle(n003) { |pr003| o003 << pr003 }; p o003
a004 = { a: 1 }; c004 = (a004.cycle(0) { |pr004| pr004 }); p c004
