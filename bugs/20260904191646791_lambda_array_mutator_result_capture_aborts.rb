g = ->(acc) { acc.push(1) }
e = []
r = g.call(e)
p r

# Secondary: every other Array mutator aborts the same way.
# g001 = ->(acc) { acc.append(1) }; e001 = []; r001 = g001.call(e001); p r001
# g002 = ->(acc) { acc.unshift(1) }; e002 = []; r002 = g002.call(e002); p r002
# g003 = ->(acc) { acc << 1 }; e003 = []; r003 = g003.call(e003); p r003
# g004 = ->(acc) { acc.concat([1]) }; e004 = []; r004 = g004.call(e004); p r004
# g005 = ->(acc) { acc.insert(0, 1) }; e005 = []; r005 = g005.call(e005); p r005

# Secondary: a non-lambda proc, and the other two call syntaxes, abort the same way.
# g006 = proc { |acc| acc.push(1) }; e006 = []; r006 = g006.call(e006); p r006
# g007 = ->(acc) { acc.push(1) }; e007 = []; r007 = g007.(e007); p r007
# g008 = ->(acc) { acc.push(1) }; e008 = []; r008 = g008[e008]; p r008

# Secondary: a String element aborts on sp_StrArray * instead.
# g009 = ->(acc) { acc.push("a") }; e009 = []; r009 = g009.call(e009); p r009

# Secondary: the capture need not be the printed value, and printing the receiver
# instead of the result aborts too.
# g010 = ->(acc) { acc.push(1) }; e010 = []; r010 = g010.call(e010); p r010.size
# g011 = ->(acc) { acc.push(1) }; e011 = []; r011 = g011.call(e011); p e011

# Controls that compile and match: no capture, a non-empty local, an empty literal
# at the call site, capturing only the class, a non-mutating body, and a method.
# g012 = ->(acc) { acc.push(1) }; e012 = []; p g012.call(e012)
# g013 = ->(acc) { acc.push(1) }; e013 = [9]; r013 = g013.call(e013); p r013
# g014 = ->(acc) { acc.push(1) }; r014 = g014.call([]); p r014
# g015 = ->(acc) { acc.push(1) }; e015 = []; r015 = g015.call(e015).class; p r015
# g016 = ->(acc) { acc.map { |x| x } }; e016 = []; r016 = g016.call(e016); p r016
# def pushed(acc) = acc.push(1)
# e017 = []; r017 = pushed(e017); p r017
