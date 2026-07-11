# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# String#%
p("%d%%" % 50)
c026 = ("%d%%" % 50); p(c026)
a005 = "%05d"; b005 = 42; p(a005 % b005)
a006 = "%05d"; b006 = 42; c027 = (a006 % b006); p(c027)
r004 = ("%,d" % 5 rescue "malformed"); p r004
r005 = ("%z" % 1 rescue "malformed"); p r005
