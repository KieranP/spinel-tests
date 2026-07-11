# frozen_string_literal: true
# Float#ceil
p(3.2.ceil)
a003 = 3.2; p(a003.ceil)
a004 = 3.2; c004 = (a004.ceil); p c004

# negative and already-integral receivers
p(-3.2.ceil)
p(3.0.ceil)
a008 = -3.9; p(a008.ceil)

# Float#ceil(n) — positive digits keep Float class
p(3.14159.ceil(2))
a005 = 3.14159; p(a005.ceil(2))
a006 = 3.14159; b006 = 2; p(a006.ceil(b006))
a007 = 3.14159; b007 = 2; c007 = (a007.ceil(b007)); p c007
p(3.14159.ceil(2).class)
p(3.14159.ceil(0))

# Float#ceil(n) — negative digits round to a power of ten (Integer)
p(1234.5678.ceil(-2))
p(-1234.5678.ceil(-2))
a009 = 15.7; b009 = -1; p(a009.ceil(b009))
a010 = 15.7; b010 = -1; c010 = (a010.ceil(b010)); p c010

# Float#ceil on Infinity (Ruby raises FloatDomainError)
r251 = (Float::INFINITY.ceil rescue $!.class); p r251
a251 = Float::INFINITY; c251 = (a251.ceil rescue $!.class); p c251

r880 = (1.5.ceil("x") rescue $!.class); p r880
