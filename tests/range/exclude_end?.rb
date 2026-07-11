# frozen_string_literal: true
# Range#exclude_end?
p((1..5).exclude_end?)
p((1...5).exclude_end?)
a001 = (1..5); p(a001.exclude_end?)
a002 = (1...5); p(a002.exclude_end?)
a003 = (1...5); c003 = (a003.exclude_end?); p c003
p((1...).exclude_end?)
