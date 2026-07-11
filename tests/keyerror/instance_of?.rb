# frozen_string_literal: true
# KeyError#instance_of?
k001 = KeyError.new("m")
p(k001.instance_of?(KeyError))
r002 = k001.instance_of?(KeyError); p r002

# instance_of? is exact class only, not ancestors
p(k001.instance_of?(IndexError))
p(k001.instance_of?(StandardError))
r003 = k001.instance_of?(IndexError); p r003

# a naturally-raised KeyError is an instance of KeyError exactly
p(begin; {a: 1}.fetch(:z); rescue => e004; e004.instance_of?(KeyError); end)
