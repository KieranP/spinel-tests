# frozen_string_literal: true
# UncaughtThrowError#tag
# An uncaught throw raises a rescuable UncaughtThrowError whose #tag is the thrown symbol.
e001 = (throw :nope, 42 rescue $!); p e001.tag
t002 = (throw :nope, 42 rescue $!).tag; p t002

# a throw with no value still carries its tag
e003 = (throw :bare rescue $!); p e003.tag

# catch-wrapped uncaught throw: the inner tag is unmatched by the outer catch
r004 = (begin; catch(:a) { throw :b }; rescue UncaughtThrowError => e004; e004.tag; end); p r004

# a matched catch never raises, so no UncaughtThrowError is produced
p(catch(:c) { throw :c, 7 })
h005 = catch(:c) { throw :c, 7 }; p h005

# a throw whose tag is unmatched by two enclosing catches keeps its own tag
# (kept commented: the nested catch aborts the C build)
t006 = (begin; catch(:outer) { catch(:inner) { throw :nope, 1 } }; rescue UncaughtThrowError => e006; e006.tag; end); p t006

# a catch whose block's value is another catch (kept commented: it aborts the C build)
p(catch(:outer) { catch(:inner) { 1 } })
v007 = catch(:outer) { catch(:inner) { throw :inner, :i } }; p v007

# binding the inner catch to a local first compiles and matches
v008 = catch(:outer) { x008 = catch(:inner) { throw :inner, :i }; x008 }; p v008

# an inner throw to the OUTER tag unwinds both catches
v009 = catch(:outer) { catch(:inner) { throw :outer, :o }; :not_here }; p v009
