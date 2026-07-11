# frozen_string_literal: true
# Regexp#source
p(/abc/.source)
a010 = /abc/; p(a010.source)

# source is the pattern text without the delimiters or flags
p(/ab/i.source)
p(/a\.b/.source)
p(/a\/b/.source)
p(Regexp.new("a+").source)
p(Regexp.new(/ab/i).source)
a011 = "wor"; p(/#{a011}ld/.source)
a012 = /(?<n>\d+)/; v012 = a012.source; p v012
p([/b/].map { |re100| re100.source })
v101 = [/b/].map { |re101| re101.source }; p v101
f102 = ->(re102) { re102.source }; p f102.call(/b/)
f103 = ->(re103) { re103.source }; v103 = f103.call(/b/); p v103
# build, so this form stays commented
p({a: /b/}.map { |k108, re108| re108.source })
v109 = {a: /b/}.map { |k109, re109| re109.source }; p v109
