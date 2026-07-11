# frozen_string_literal: true
# NameError#is_a?
p(NameError.new("x").is_a?(NameError))
p(NameError.new("x").is_a?(StandardError))
p(NameError.new("x").is_a?(Exception))
v001 = NameError.new("x").is_a?(StandardError); p v001
p(NameError.new("x").kind_of?(NameError))
v002 = NameError.new("x").kind_of?(Exception); p v002
# a naturally-raised NameError is-a NameError
begin; Object.const_get(:MissingConstF); rescue NameError => e003; p(e003.is_a?(NameError)); p(e003.is_a?(StandardError)); end
v004 = (begin; Object.const_get(:MissingConstF); rescue NameError => e004; e004.is_a?(NameError); end); p v004
