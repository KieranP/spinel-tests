# frozen_string_literal: true
# Regexp#==
p(/ab/ == /ab/)
a031 = /ab/; b031 = /ab/; p(a031 == b031)
a032 = /ab/; v032 = (a032 == a032); p v032

# == compares source AND options
p(/ab/ == /ab/i)
p(/ab/ == /ab/m)
a033 = /ab/; b033 = /ab/x; v033 = (a033 == b033); p v033
p(/ab/i == /ab/i)
p(/ab/ == /ba/)
p(Regexp.new("ab") == /ab/)
a034 = Regexp.new("ab", Regexp::IGNORECASE); p(a034 == /ab/i)

# == against a non-Regexp is false. Kept commented: a front-end reject takes down the file.
p(/ab/ == "ab")
a035 = /ab/; v035 = (a035 == nil); p v035
a036 = /ab/; v036 = (a036 == 1); p v036
