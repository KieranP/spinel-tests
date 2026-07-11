# frozen_string_literal: true
# Symbol#equal?
a026 = :abc; p(a026.equal?(a026))
a027 = :abc; b027 = :abc; p(a027.equal?(b027))
a028 = :abc; v028 = a028.equal?(a028); p v028
