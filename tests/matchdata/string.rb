# frozen_string_literal: true
# MatchData#string
p("hello".match(/l/).string)
m001 = "hello".match(/l/); v001 = m001.string; p v001

# string is the whole subject, frozen, even for a match in the middle.
p("hello world".match(/o w/).string)
p("hello".match(/l/).string.frozen?)
m002 = "hello world".match(/o w/); v002 = m002.string; p v002
