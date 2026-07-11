# frozen_string_literal: true
# Time#gmtime (in-place converter)

a001 = Time.at(0)
a001.gmtime
p a001.utc?

b002 = Time.at(0)
c002 = b002.gmtime
p c002.class
p b002.utc?
