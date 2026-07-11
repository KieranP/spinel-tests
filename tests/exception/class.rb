# frozen_string_literal: true
# Exception#class
# the class of an exception object
p(RuntimeError.new("x").class)
c001 = RuntimeError.new("x").class; p c001

p(ArgumentError.new.class)
c002 = ArgumentError.new.class; p c002

# a rescued exception reports its concrete class
begin; raise TypeError, "t"; rescue => e003; p e003.class; end
c004 = (begin; raise TypeError, "t"; rescue => e004; e004.class; end); p c004

# a bare string raise yields a RuntimeError
begin; raise "plain"; rescue => e005; p e005.class; end

# a custom subclass reports itself
class MyErr006 < StandardError; end
begin; raise MyErr006, "m"; rescue => e006; p e006.class; end
c007 = (begin; raise MyErr006; rescue => e007; e007.class; end); p c007

# class name via Module#name and Module#to_s
begin; raise RangeError, "r"; rescue => e008; p e008.class.name; end
begin; raise ZeroDivisionError, "z"; rescue => e009; p e009.class.to_s; end

# two instances of the same class share a class
c010 = (RuntimeError.new("a").class == RuntimeError.new("b").class); p c010

# StandardError is the superclass of RuntimeError
p(RuntimeError.new("s").class.superclass)
c011 = RuntimeError.new("s").class.superclass; p c011

# a typed rescue clause naming a user subclass that overrides #message
class MsgOver012 < StandardError
  def message; "overridden"; end
end
begin; raise MsgOver012; rescue MsgOver012 => e012; p e012.class; end
c013 = (begin; raise MsgOver012; rescue MsgOver012 => e013; e013.class; end); p c013
