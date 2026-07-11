# frozen_string_literal: true
# NoMethodError#instance_of?
# instance_of? tests the exact class only (true for NoMethodError, false for ancestors)
p(NoMethodError.new("x").instance_of?(NoMethodError))
v001 = NoMethodError.new("x").instance_of?(NoMethodError); p v001
p(NoMethodError.new("x").instance_of?(NameError))
p(NoMethodError.new("x").instance_of?(StandardError))
p(NoMethodError.new("x").instance_of?(Exception))
v002 = NoMethodError.new("x").instance_of?(NameError); p v002
# a naturally-raised error is instance_of? NoMethodError only
begin; nil.foo; rescue NoMethodError => e003; p(e003.instance_of?(NoMethodError)); end
begin; nil.foo; rescue NoMethodError => e004; p(e004.instance_of?(NameError)); end
