# frozen_string_literal: true
# String#upcase
p("HeLLo".upcase)

a001 = "HeLLo"
p a001.class
p a001.upcase

a002 = "HeLLo"
c002 = a002.upcase
p c002.class
p c002

p("mixed CASE 123".upcase)

a003 = "mixed CASE 123"
p a003.class
p a003.upcase

a004 = "mixed CASE 123"
c004 = a004.upcase
p c004.class
p c004

p("punct!? abc-def".upcase)

a005 = "punct!? abc-def"
p a005.class
p a005.upcase

a006 = "punct!? abc-def"
c006 = a006.upcase
p c006.class
p c006

p("already upper".upcase)

a007 = "already upper"
p a007.class
p a007.upcase

a008 = "already upper"
c008 = a008.upcase
p c008.class
p c008

# empty string
p("".upcase)

# upcase returns a new String; receiver is unchanged
a009 = "abc"; a009.upcase; p a009

# non-ASCII case folding needs Unicode case tables Spinel does not carry (cf. limitations.md grapheme_clusters / "no encoding")
# non-ASCII (Latin-1) Unicode case folding
p("héllo".upcase)
a010 = "héllo"; c010 = (a010.upcase); p c010
