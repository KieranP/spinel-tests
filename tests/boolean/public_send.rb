# frozen_string_literal: true
# TrueClass#public_send
p(true.public_send(:to_s))
p(true.public_send(:&, false))
p(true.public_send(:|, false))

a001 = true; p(a001.public_send(:class))

a002 = true; b002 = false
r002 = a002.public_send(:^, b002); p r002

a003 = true; v003 = a003.public_send(:!); p v003

# FalseClass#public_send
p(false.public_send(:to_s))
p(false.public_send(:|, true))

a004 = false; r004 = a004.public_send(:&, true); p r004

a005 = false; p(a005.public_send(:class))
