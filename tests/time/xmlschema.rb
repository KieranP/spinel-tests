# frozen_string_literal: true
# Time#xmlschema

a001 = Time.utc(2026, 7, 16, 13, 45, 30)
p a001.xmlschema
b002 = Time.utc(2026, 7, 16, 13, 45, 30)
c002 = b002.xmlschema
p c002

p Time.utc(2020, 1, 1).xmlschema(3)
d003 = Time.utc(2020, 1, 1); e003 = d003.xmlschema(3); p e003

p Time.utc(2020, 1, 2, 3, 4, 5, 678901).xmlschema(0)
p Time.utc(2020, 1, 2, 3, 4, 5, 678901).xmlschema(1)
p Time.utc(2020, 1, 2, 3, 4, 5, 678901).xmlschema(6)
p Time.utc(2020, 1, 2, 3, 4, 5, 678901).xmlschema(9)
f004 = Time.utc(2020, 1, 2, 3, 4, 5, 678901); g004 = f004.xmlschema(6); p g004
p f004.getlocal("-08:00").xmlschema(3)
p f004.getlocal("+05:30").xmlschema
h005 = f004.getlocal("+05:30").xmlschema; p h005
p Time.utc(1960, 5, 4, 3, 2, 1).xmlschema
p Time.at(0).utc.xmlschema
