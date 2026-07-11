# frozen_string_literal: true
# Regexp#eql?
p(/ab/.eql?(/ab/))
a029 = /ab/; b029 = /ab/; p(a029.eql?(b029))
a030 = /ab/; v030 = a030.eql?(a030); p v030

# eql? compares source AND options
p(/ab/.eql?(/ab/i))
p(/ab/i.eql?(/ab/i))
a031 = /ab/; b031 = /ba/; v031 = a031.eql?(b031); p v031

# eql? against a non-Regexp is false. Kept commented: a front-end reject takes down the file.
p(/ab/.eql?("ab"))
a032 = /ab/; v032 = a032.eql?(nil); p v032

# A Regexp.new pattern is eql? to the identical literal
p(Regexp.new("ab").eql?(/ab/))
a033 = Regexp.new("ab"); v033 = a033.eql?(/ab/); p v033
