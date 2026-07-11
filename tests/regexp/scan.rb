# frozen_string_literal: true
# Regexp#scan
p("a1b2c3".scan(/\d/))
p("key=val;a=b".scan(/(\w+)=(\w+)/))
a009 = "a1b2c3"; b009 = /\d/; c009 = (a009.scan(b009)); p c009

# scan with no capture group returns whole matches
p("cat dog cat".scan(/cat|dog/))
a010 = "cat dog cat"; v010 = (a010.scan(/\w+/)); p v010

# scan with a single capture group returns the captured substrings
p("a1b2".scan(/([a-z])\d/))
a011 = "a1b2"; v011 = (a011.scan(/([a-z])\d/)); p v011

# scan with a block yields each match
r012 = []; "a1b2".scan(/(\w)(\d)/) { |x012, y012| r012 << [x012, y012] }; p r012

# scan, no match returns an empty array
p("abc".scan(/\d/))
a013 = "abc"; v013 = (a013.scan(/\d/)); p v013

# scan with the empty pattern
p("abc".scan(//))
a014 = "abc"; v014 = (a014.scan(//)); p v014

# scan case-insensitive flag
p("Hello WORLD".scan(/[a-z]+/i))
a015 = "Hello WORLD"; v015 = (a015.scan(/[a-z]+/i)); p v015

# scan anchors and lookaround
p("foo\nbar".scan(/^\w+/))
p("price100 cost50".scan(/\d+(?= )/))
p("a1b2".scan(/(?<=[a-z])\d/))
a016 = "foo\nbar"; v016 = (a016.scan(/\w+$/)); p v016

# scan multibyte
p("héllo wörld".scan(/\w+/))
a017 = "日本語"; v017 = (a017.scan(/./)); p v017
