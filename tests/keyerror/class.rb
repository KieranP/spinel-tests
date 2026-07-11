# frozen_string_literal: true
# KeyError#class
# the class of a KeyError object
p(KeyError.new("x").class)
c001 = KeyError.new("x").class; p c001

p(KeyError.new.class)
c002 = KeyError.new.class; p c002

# a rescued (natural) KeyError reports its concrete class
begin; {a: 1}.fetch(:z); rescue => e003; p e003.class; end
c004 = (begin; {a: 1}.fetch(:z); rescue => e004; e004.class; end); p c004

# class name via Module#name and Module#to_s
p(KeyError.new("x").class.name)
p(KeyError.new("x").class.to_s)

# two instances share a class
c005 = (KeyError.new("a").class == KeyError.new("b").class); p c005

# ancestry: KeyError < IndexError < StandardError.  The class constant reports it correctly.
p(KeyError.superclass)
p(IndexError.superclass)

# ...but reading superclass off an instance's #class returns Object
p(KeyError.new("m").class.superclass)
s006 = KeyError.new("m").class.superclass; p s006
