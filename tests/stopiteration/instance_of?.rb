# frozen_string_literal: true
# StopIteration#instance_of?
k001 = StopIteration.new("m")
p(k001.instance_of?(StopIteration))
r002 = k001.instance_of?(StopIteration); p r002

# instance_of? is exact class only, not ancestors
p(k001.instance_of?(IndexError))
p(k001.instance_of?(StandardError))
p(k001.instance_of?(Exception))
r003 = k001.instance_of?(IndexError); p r003

# a StopIteration from an exhausted enumerator is an instance of StopIteration exactly
# (captured inside the rescue)
e004 = [1].each; e004.next
r004 = (begin; e004.next; rescue StopIteration => z004; z004.instance_of?(StopIteration); end); p r004
