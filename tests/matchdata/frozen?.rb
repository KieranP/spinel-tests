# frozen_string_literal: true
# MatchData#frozen?
# Kept commented: a front-end reject takes down the file.
p("hello".match(/l+/).frozen?)
m001 = "hello".match(/l+/); v001 = m001.frozen?; p v001
