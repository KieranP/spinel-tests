# frozen_string_literal: true
# Float#equal?
a026 = 1.5; p(a026.equal?(a026))
a027 = 1.5; b027 = 1.5; p(a027.equal?(b027))
a028 = 1.5; v028 = a028.equal?(a028); p v028

# a NaN is the same value as itself, so CRuby's identity check answers true
n880 = Float::NAN; p(n880.equal?(n880))
n881 = Float::NAN; v881 = n881.equal?(n881); p v881
