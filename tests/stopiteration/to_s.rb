# frozen_string_literal: true
# StopIteration#to_s
p(StopIteration.new("boom").to_s)
s001 = StopIteration.new("boom").to_s; p s001

# default to_s is the class name
p(StopIteration.new.to_s)
s002 = StopIteration.new.to_s; p s002

# explicit nil argument falls back to the class name
p(StopIteration.new(nil).to_s)
s003 = StopIteration.new(nil).to_s; p s003

# to_s of a StopIteration from an exhausted enumerator (captured inside the rescue)
e004 = [1].each; e004.next
r004 = (begin; e004.next; rescue StopIteration => z004; z004.to_s; end); p r004

# to_s is a non-empty String
e005 = [1].each; e005.next
r005 = (begin; e005.next; rescue StopIteration => z005; z005.to_s.length > 0; end); p r005
