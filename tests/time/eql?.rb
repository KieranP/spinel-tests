# frozen_string_literal: true
# Time#eql?

a001 = Time.utc(2020, 1, 1)
b001 = Time.utc(2020, 1, 1)
p a001.eql?(b001)
c002 = a001.eql?(b001)
p c002

p Time.utc(2020, 1, 1).eql?(Time.utc(2020, 1, 2))
p Time.utc(2020, 1, 1, 0, 0, 0, 1).eql?(Time.utc(2020, 1, 1))
p Time.at(0).eql?(Time.utc(1970, 1, 1))
p a001.eql?(5)
p a001.eql?(nil)
p Time.utc(2020, 1, 1).getlocal("+09:00").eql?(a001)
d003 = Time.at(0).eql?(Time.utc(1970, 1, 1)); p d003

# A Time read back out of a container.
e004 = [Time.utc(2020, 1, 2)]
p e004[0].eql?(Time.utc(2020, 1, 2))
f004 = e004[0].eql?(Time.utc(2020, 1, 2)); p f004
