# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# Kernel#throw
r361 = catch(:t) { throw :t, 99 }; p r361
p(catch(:u) { throw :u })
r362 = (throw(:nope) rescue $!.class); p r362

# an uncaught throw carries its tag and value on the UncaughtThrowError
r363 = (catch(:x) { throw :y, 5 } rescue $!.message); p r363
r364 = (catch(:x) { throw :y, 5 } rescue $!.tag); p r364
r365 = (catch(:x) { throw :y, 5 } rescue $!.value); p r365

# throwing a String tag, an object tag, and a tag with no value
p(catch("s") { throw "s", :v })
v366 = catch("s") { throw "s" }; p v366
o367 = Object.new
p(catch(o367) { throw o367, 6 })
v367 = catch(o367) { throw o367 }; p v367

# throw from inside a method, and from inside a block
def th368; throw :t368, 7; end
p(catch(:t368) { th368 })
v368 = catch(:t368) { [1].each { th368 }; :no }; p v368
# a catch whose block VALUE is a multi-element Array#each aborts the C build:
v369 = catch(:t368) { [1, 2].each { |i| throw :t368, i } }; p v369
