# frozen_string_literal: true
# Regexp#hash
p(/ab/.hash.is_a?(Integer))
a022 = /ab/; p(a022.hash == a022.hash)
a023 = /ab/; v023 = (a023.hash.is_a?(Integer)); p v023

# Equal-source but differently-flagged patterns hash apart
p(/ab/.hash == /ab/i.hash)
a024 = /ab/; b024 = /ab/i; v024 = (a024.hash == b024.hash); p v024

# The same source and flags hash together
p(/ab/i.hash == /ab/i.hash)
a025 = Regexp.new("ab"); v025 = (a025.hash == /ab/.hash); p v025
p(Regexp.new("ab").hash == /ab/.hash)
