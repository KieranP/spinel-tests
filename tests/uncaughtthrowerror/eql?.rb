# frozen_string_literal: true
# UncaughtThrowError#eql? (Object#eql? — identity for exception instances)
e001 = (throw :x, 5 rescue $!)
p(e001.eql?(e001))
r002 = e001.eql?(e001); p r002

# distinct instances are not eql? even with an equal tag/value (identity)
e003 = (throw :x, 5 rescue $!)
e004 = (throw :x, 5 rescue $!)
p(e003.eql?(e004))
c005 = e003.eql?(e004); p c005

# not eql? to a non-exception
p(e001.eql?("x"))
