# frozen_string_literal: true
# Enumerator#equal?
a026 = [1, 2, 3].each; p(a026.equal?(a026))
a027 = [1, 2, 3].each; b027 = [1, 2, 3].each; p(a027.equal?(b027))
a028 = [1, 2, 3].each; v028 = a028.equal?(a028); p v028
