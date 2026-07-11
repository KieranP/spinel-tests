# frozen_string_literal: true
# SystemExit#instance_of?
k001 = SystemExit.new(2)
p(k001.instance_of?(SystemExit))
r002 = k001.instance_of?(SystemExit); p r002

# instance_of? is exact class only, not ancestors
p(k001.instance_of?(Exception))
p(k001.instance_of?(Object))
r003 = k001.instance_of?(Exception); p r003

# a naturally-raised exit is an instance of SystemExit exactly
p(begin; exit(1); rescue SystemExit => e004; e004.instance_of?(SystemExit); end)
