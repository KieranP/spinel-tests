# frozen_string_literal: true
# StopIteration#is_a? / #kind_of? (StopIteration < IndexError < StandardError < Exception)
k001 = StopIteration.new("m")
p(k001.is_a?(StopIteration))
p(k001.is_a?(IndexError))
p(k001.is_a?(StandardError))
p(k001.is_a?(Exception))
p(k001.is_a?(ArgumentError))
r002 = k001.is_a?(IndexError); p r002

# kind_of? is the alias
p(k001.kind_of?(IndexError))
r003 = k001.kind_of?(StandardError); p r003

# a StopIteration from an exhausted enumerator, queried INSIDE the rescue
# (cleanly typed), reports its ancestry correctly.
e004 = [1].each; e004.next
r004 = (begin; e004.next; rescue StopIteration => z004; z004.is_a?(IndexError); end); p r004
e005 = [1].each; e005.next
r005 = (begin; e005.next; rescue StopIteration => z005; z005.is_a?(StandardError); end); p r005

# ...but the SAME exception captured OUT of the rescue into a poly-union local loses
# its ancestor identity: is_a? on every ancestor answers false (the exact class is kept).
e006 = [1].each; e006.next
ex006 = (begin; e006.next; rescue StopIteration => z006; z006; end)
p ex006.is_a?(StopIteration)
p ex006.is_a?(StandardError)
r007 = ex006.is_a?(IndexError); p r007
