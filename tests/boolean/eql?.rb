# frozen_string_literal: true
# TrueClass#eql?
p(true.eql?(true))
a029 = true; b029 = true; p(a029.eql?(b029))
a030 = true; v030 = a030.eql?(a030); p v030

# eql? is strict — false for a different boolean and for non-boolean values
# (unlike ==, eql? does no type coercion, but for booleans == is also strict)
p(true.eql?(false))
p(true.eql?(1))
p(true.eql?(nil))
a031 = true; b031 = 1; p(a031.eql?(b031))
a032 = true; v032 = a032.eql?(false); p v032

# FalseClass#eql?
p(false.eql?(false))
a074 = false; b074 = false; p(a074.eql?(b074))
a075 = false; v075 = a075.eql?(a075); p v075
p(false.eql?(true))
p(false.eql?(0))
p(false.eql?(nil))
