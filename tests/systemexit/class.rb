# frozen_string_literal: true
# SystemExit#class
# the class of a SystemExit object
p(SystemExit.new(2).class)
c001 = SystemExit.new(2).class; p c001

p(SystemExit.new.class)
c002 = SystemExit.new.class; p c002

# a rescued (natural) exit reports its concrete class
begin; exit(1); rescue SystemExit => e003; p e003.class; end
c004 = (begin; exit(1); rescue SystemExit => e004; e004.class; end); p c004

# class name via Module#name and Module#to_s
p(SystemExit.new(2).class.name)
p(SystemExit.new(2).class.to_s)

# two instances share a class
c005 = (SystemExit.new("a").class == SystemExit.new(2).class); p c005

# ancestry: SystemExit < Exception.  The class constant reports it correctly.
p(SystemExit.superclass)

# ...but reading superclass off an instance's #class returns Object
p(SystemExit.new(2).class.superclass)
s006 = SystemExit.new(2).class.superclass; p s006
