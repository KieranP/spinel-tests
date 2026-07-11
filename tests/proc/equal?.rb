# frozen_string_literal: true
# Proc#equal?
a026 = ->(a) { a }; p(a026.equal?(a026))
a027 = ->(a) { a }; b027 = ->(a) { a }; p(a027.equal?(b027))
a028 = ->(a) { a }; v028 = a028.equal?(a028); p v028
