# frozen_string_literal: true
# StopIteration.new
# String message
p(StopIteration.new("boom").message)
n001 = StopIteration.new("boom"); p n001.message

# no argument -> default (class name) message
p(StopIteration.new.message)
n002 = StopIteration.new; p n002.message

# explicit nil message defaults to the class name
p(StopIteration.new(nil).message)
n003 = StopIteration.new(nil).message; p n003

# a freshly constructed StopIteration has a nil #result
p(StopIteration.new("m").result)
n004 = StopIteration.new("m"); p n004.result

# constructed instance is a StopIteration
p(StopIteration.new("m").class)
n005 = StopIteration.new("m"); p n005.class

# raising a constructed instance preserves its message
p(begin; raise StopIteration.new("boom"); rescue => e006; e006.message; end)
r006 = (begin; raise StopIteration.new("boom"); rescue => e007; e007.message; end); p r006

# raising the class alone uses the default (class name) message
p(begin; raise StopIteration; rescue => e008; e008.message; end)
