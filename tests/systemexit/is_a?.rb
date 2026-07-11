# frozen_string_literal: true
# SystemExit#is_a? / #kind_of? (SystemExit < Exception, NOT a StandardError)
k001 = SystemExit.new(2)
p(k001.is_a?(SystemExit))
p(k001.is_a?(Exception))
p(k001.is_a?(Object))
p(k001.is_a?(StandardError))
p(k001.is_a?(RuntimeError))
r002 = k001.is_a?(Exception); p r002

# kind_of? is the alias
p(k001.kind_of?(Exception))
r003 = k001.kind_of?(SystemExit); p r003

# a naturally-raised exit is a SystemExit and an Exception but not a StandardError
p(begin; exit(1); rescue SystemExit => e004; e004.is_a?(SystemExit); end)
r005 = (begin; exit(1); rescue SystemExit => e005; e005.is_a?(Exception); end); p r005
p(begin; exit(1); rescue SystemExit => e006; e006.is_a?(StandardError); end)
