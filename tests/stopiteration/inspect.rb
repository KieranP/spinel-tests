# frozen_string_literal: true
# StopIteration#inspect
p(StopIteration.new("boom").inspect)
i001 = StopIteration.new("boom").inspect; p i001

# no message: inspect shows the class name as the message
p(StopIteration.new.inspect)
i002 = StopIteration.new.inspect; p i002

# `p` on a StopIteration object uses inspect
p(StopIteration.new("via p"))
a003 = StopIteration.new("via p"); p a003

# inspect of a StopIteration from an exhausted enumerator (captured inside the rescue)
# is a non-empty String
e004 = [1].each; e004.next
r004 = (begin; e004.next; rescue StopIteration => z004; z004.inspect.class; end); p r004

e005 = [1].each; e005.next
r005 = (begin; e005.next; rescue StopIteration => z005; z005.inspect.length > 0; end); p r005
