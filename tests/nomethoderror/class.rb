# frozen_string_literal: true
# NoMethodError#class
p(NoMethodError.new("x").class)
v001 = NoMethodError.new("x").class; p v001
# NoMethodError sits below NameError and StandardError (constant form is correct)
p(NoMethodError < NameError)
v002 = (NoMethodError < NameError); p v002
p(NoMethodError < StandardError)
p(NoMethodError.ancestors.include?(NameError))
p(NoMethodError.superclass)
# a naturally-raised error's class is NoMethodError
begin; nil.foo; rescue NoMethodError => e003; p e003.class; end
v003 = (begin; nil.foo; rescue NoMethodError => e004; e004.class; end); p v003
# superclass / ancestors reached through an instance's #class collapse to Object under Spinel
p(NoMethodError.new("x").class.superclass)
p(NoMethodError.new("x").class.ancestors.include?(NameError))
