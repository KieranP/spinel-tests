# frozen_string_literal: true
# StopIteration#class
# the class of a StopIteration object
p(StopIteration.new("x").class)
c001 = StopIteration.new("x").class; p c001

p(StopIteration.new.class)
c002 = StopIteration.new.class; p c002

# a StopIteration from an exhausted external Enumerator reports its concrete class
# (captured inside the rescue)
e003 = [1].each; e003.next
r003 = (begin; e003.next; rescue StopIteration => z003; z003.class; end); p r003

# class name via Module#name and Module#to_s
p(StopIteration.new("x").class.name)
p(StopIteration.new("x").class.to_s)

# two instances share a class
c004 = (StopIteration.new("a").class == StopIteration.new("b").class); p c004

# ancestry: StopIteration < IndexError < StandardError.  The class constant reports it correctly.
p(StopIteration.superclass)
p(StopIteration < IndexError)
s005 = StopIteration.superclass; p s005

# ...but reading superclass / ancestors off an instance's #class collapses to Object.
p(StopIteration.new("m").class.superclass)
s006 = StopIteration.new("m").class.superclass; p s006
p(StopIteration.new("m").class.ancestors)
a007 = StopIteration.new("m").class.ancestors; p a007
