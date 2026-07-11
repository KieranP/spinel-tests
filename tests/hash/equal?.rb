# frozen_string_literal: true
# Hash#equal?
a026 = { a: 1 }; p(a026.equal?(a026))
a027 = { a: 1 }; b027 = { a: 1 }; p(a027.equal?(b027))
a028 = { a: 1 }; v028 = a028.equal?(a028); p v028
