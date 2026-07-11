# frozen_string_literal: true
# NameError#class
p(NameError.new("x").class)
v001 = NameError.new("x").class; p v001
# NameError sits below StandardError
p(NameError.ancestors.include?(StandardError))
p(NameError < StandardError)
v002 = (NameError < StandardError); p v002
# a missing constant via a literal module receiver raises a NameError
begin; Object.const_get(:MissingConstD); rescue NameError => e003; p e003.class; end
v004 = (begin; Object.const_get(:MissingConstD); rescue NameError => e004; e004.class; end); p v004
# a missing constant via a computed module receiver should also be a NameError
begin; self.class.const_get(:MissingConstE); rescue NameError => e005; p e005.class; end
