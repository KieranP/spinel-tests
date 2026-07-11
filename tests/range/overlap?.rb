# frozen_string_literal: true
# Range#overlap?
p((1..5).overlap?(3..8))
p((1..5).overlap?(6..8))
a001 = (1..5); p(a001.overlap?(3..8))
a002 = (1..5); b002 = (3..8); p(a002.overlap?(b002))
a003 = (1..5); b003 = (6..8); c003 = (a003.overlap?(b003)); p c003
p((1...5).overlap?(5..8))
p((1..5).overlap?(5..8))
