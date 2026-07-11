# frozen_string_literal: true
# Regexp#timeout
p(/a/.timeout)
a001 = /a/; p(a001.timeout)

# Regexp.timeout / Regexp.timeout= (class-level global timeout)
p(Regexp.timeout)
p(Regexp.timeout = 5)
