# frozen_string_literal: true
# StopIteration#message
p(StopIteration.new("boom").message)
m001 = StopIteration.new("boom").message; p m001

# default message is the class name
p(StopIteration.new.message)
m002 = StopIteration.new.message; p m002

# explicit nil argument falls back to the class name
p(StopIteration.new(nil).message)
m003 = StopIteration.new(nil).message; p m003

# message and to_s agree
a004 = StopIteration.new("z"); p(a004.message == a004.to_s)
r004 = (a004.message == a004.to_s); p r004

# a StopIteration from an exhausted external Enumerator carries the standard message.
# Captured inside the rescue (cleanly typed) — the assignment form.
e005 = [1].each; e005.next
r005 = (begin; e005.next; rescue StopIteration => z005; z005.message; end); p r005

# its message is a non-empty String
e006 = [1].each; e006.next
r006 = (begin; e006.next; rescue StopIteration => z006; z006.message.class; end); p r006

# raising the class alone uses the default (class name) message
p(begin; raise StopIteration; rescue => e007; e007.message; end)
