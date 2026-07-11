# frozen_string_literal: true
# TrueClass#equal?
a026 = true; p(a026.equal?(a026))
a027 = true; b027 = true; p(a027.equal?(b027))
a028 = true; v028 = a028.equal?(a028); p v028

# FalseClass#equal?
a071 = false; p(a071.equal?(a071))
a072 = false; b072 = false; p(a072.equal?(b072))
a073 = false; v073 = a073.equal?(a073); p v073
