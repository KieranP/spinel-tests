# frozen_string_literal: true
# Array#join

p([1, 2, 3].join("-"))

a001 = [1, 2, 3]
p a001.class
p a001.join("-")

a002 = [1, 2, 3]
b002 = "-"
p b002.class
p a002.join(b002)

a003 = [1, 2, 3]
b003 = "-"
c003 = a003.join(b003)
p c003.class
p c003

p([1.1, 2.2, 3.3].join("-"))

a004 = [1.1, 2.2, 3.3]
p a004.class
p a004.join("-")

a005 = [1.1, 2.2, 3.3]
b005 = "-"
p b005.class
p a005.join(b005)

a006 = [1.1, 2.2, 3.3]
b006 = "-"
c006 = a006.join(b006)
p c006.class
p c006

p(["1", "2", "3"].join("-"))

a007 = ["1", "2", "3"]
p a007.class
p a007.join("-")

a008 = ["1", "2", "3"]
b008 = "-"
p b008.class
p a008.join(b008)

a009 = ["1", "2", "3"]
b009 = "-"
c009 = a009.join(b009)
p c009.class
p c009

# no-arg (default empty separator)
p([1, 2, 3].join)
a010 = [1, 2, 3]
c010 = a010.join
p c010.class
p c010

# empty -> ""
p([].join("-"))
a011 = []
c011 = a011.join("-")
p c011

# nested arrays (join recurses)
p([1, [2, 3]].join("-"))
a012 = [1, [2, 3]]
c012 = a012.join("-")
p c012

# single element
p([5].join("-"))
a013 = [5]
c013 = a013.join("-")
p c013

# multi-char separator
p([1, 2, 3].join("--"))
a014 = [1, 2, 3]
c014 = a014.join("--")
p c014

# nil element renders as ""
p([1, nil, 3].join("-"))
a015 = [1, nil, 3]
c015 = a015.join("-")
p c015

# a splatted argument list held in a variable
sj160 = ["-"]
p([1, 2].join(*sj160))
vj160 = [1, 2].join(*sj160); p vj160
# control: the same argument positionally, and a literal array splatted in place
p([1, 2].join("-"))
p([1, 2].join(*["-"]))

# nested arrays are joined recursively; nil becomes an empty string
p([1, [2, [3]]].join("-"))
w361 = [1, [2, [3]]].join("-"); p w361
p([1, nil, 2].join(","))
w362 = [1, nil, 2].join(","); p w362
p([].join(","))
p([1, 2].join)
w363 = [1, 2].join; p w363
p([[1, 2], [3]].join(""))
p([1, 2, 3].join(""))
s364 = "|"
p([1, 2, 3].join(s364))
w364 = [1, 2, 3].join(s364); p w364
p([[["a"]]].join("."))
