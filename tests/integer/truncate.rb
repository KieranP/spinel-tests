# frozen_string_literal: true
# Integer#truncate
p(1234.truncate)
p(1234.truncate(-2))
p((-1234).truncate(-2))
p(1234.truncate(2))
p(5.truncate(-1))
a001 = 1234; p(a001.truncate(-2))
a002 = 1234; b002 = -2; p(a002.truncate(b002))
a003 = 1234; b003 = -2; c003 = (a003.truncate(b003)); p c003
p(1234.truncate.class)
