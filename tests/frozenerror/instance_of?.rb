# frozen_string_literal: true
# FrozenError#instance_of?
f001 = FrozenError.new("m")
p(f001.instance_of?(FrozenError))
r002 = f001.instance_of?(FrozenError); p r002

# instance_of? is exact class only, not ancestors
p(f001.instance_of?(RuntimeError))
p(f001.instance_of?(StandardError))
r003 = f001.instance_of?(RuntimeError); p r003

# a naturally-raised frozen error is an instance of FrozenError exactly
p(begin; "s".freeze << "x"; rescue => e004; e004.instance_of?(FrozenError); end)
