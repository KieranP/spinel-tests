# frozen_string_literal: true
# NoMethodError#is_a?
p(NoMethodError.new("x").is_a?(NoMethodError))
p(NoMethodError.new("x").is_a?(NameError))
p(NoMethodError.new("x").is_a?(StandardError))
p(NoMethodError.new("x").is_a?(Exception))
v001 = NoMethodError.new("x").is_a?(NameError); p v001
p(NoMethodError.new("x").kind_of?(StandardError))
v002 = NoMethodError.new("x").kind_of?(Exception); p v002
# a naturally-raised NoMethodError is-a NoMethodError / NameError / StandardError
begin; nil.foo; rescue NoMethodError => e003; p(e003.is_a?(NoMethodError)); p(e003.is_a?(NameError)); p(e003.is_a?(StandardError)); end
v003 = (begin; nil.foo; rescue NoMethodError => e004; e004.is_a?(NameError); end); p v003
