# frozen_string_literal: true
# String#byterindex
p("hello".byterindex("l"))
a01 = "hello"; p(a01.byterindex("l"))
a02 = "hello"; b02 = "l"; p(a02.byterindex(b02))
a03 = "hello"; b03 = "l"; c03 = (a03.byterindex(b03)); p c03
# start offset (searches right-to-left up to the offset)
p("hello".byterindex("l", 2))
# Regexp argument
p("hello".byterindex(/l/))
# not found returns nil
p("hello".byterindex("z"))
a04 = "hello"; c04 = (a04.byterindex("z")); p c04
