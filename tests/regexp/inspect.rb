# frozen_string_literal: true
# Regexp#inspect
p(/abc/.inspect)
a011 = /abc/; p(a011.inspect)

# inspect renders the trailing flag letters
p(/ab/i.inspect)
p(/ab/m.inspect)
p(/ab/mix.inspect)
a012 = /ab/i; v012 = (a012.inspect); p v012

# inspect of a Regexp.new-constructed receiver
p(Regexp.new("ab").inspect)
b012 = Regexp.new("ab"); v0122 = (b012.inspect); p v0122

# a '/' in the source is escaped in the rendered form
p(/a\/b/.inspect)
a013 = /a\/b/; v013 = (a013.inspect); p v013

# inspect of a pattern with named groups and of an interpolated one
p(/(?<n>\d+)/.inspect)
a014 = "wor"; p(/#{a014}ld/.inspect)
a015 = /(?<n>\d+)/mix; v015 = a015.inspect; p v015
