# frozen_string_literal: true
# Regexp#to_s
p(/abc/.to_s)
a012 = /abc/; p(a012.to_s)

# to_s renders the flag prefix
p(/ab/i.to_s)
p(/ab/m.to_s)
p(/ab/x.to_s)
p(/ab/mix.to_s)
p(/(?<n>\d)/i.to_s)
a013 = /ab/mix; v013 = (a013.to_s); p v013

# to_s of a Regexp.new-constructed receiver
p(Regexp.new("ab").to_s)
b013 = Regexp.new("ab"); v0132 = (b013.to_s); p v0132

# a '/' in the source is escaped in the rendered form
p(/a\/b/.to_s)
a014 = /a\/b/; v014 = (a014.to_s); p v014

# to_s embeds the flags as an inline option group, so it nests inside another pattern
p(/#{/ab/i}c/.match?("ABc"))
p(/#{/ab/i}c/.match?("abC"))
a015 = /ab/i; v015 = /#{a015}c/.source; p v015

# to_s of a pattern with named groups
p(/(?<n>\d+)/.to_s)
a016 = /(?<n>\d+)/m; v016 = a016.to_s; p v016
