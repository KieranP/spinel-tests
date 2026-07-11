# frozen_string_literal: true
# Class#respond_to? / Module#respond_to?

# a user class answers its own singleton methods correctly
class Widget001
  def self.build = new
  def spin = 1
end
p Widget001.respond_to?(:build)
p Widget001.respond_to?(:nope)
c001 = Widget001.respond_to?(:build)
p c001.class
p c001

# an instance receiver is correct too
p Widget001.new.respond_to?(:spin)
c002 = Widget001.new.respond_to?(:spin)
p c002

# a module reports its own INSTANCE methods as available on the module object
module Greeter003
  def greet = "hi"
  def self.version = 1
end
p Greeter003.respond_to?(:version)
p Greeter003.respond_to?(:greet)
p Greeter003.respond_to?(:missing)
c003 = Greeter003.respond_to?(:greet)
p c003

# an including class does NOT expose the mixin's instance methods as singletons
class Host004
  include Greeter003
  def self.make = new
end
p Host004.respond_to?(:make)
p Host004.respond_to?(:greet)
p Host004.new.respond_to?(:greet)

# a core class receiver answers its own singleton methods
p Array.respond_to?(:new)
c005 = Array.respond_to?(:new)
p c005
p String.respond_to?(:new)
p Integer.respond_to?(:sqrt)
p Comparable.respond_to?(:new)
p Struct.respond_to?(:new)
c006 = Struct.respond_to?(:new)
p c006
p Array.respond_to?(:[])
c007 = Array.respond_to?(:[])
p c007
p Range.respond_to?(:new)
c009 = Range.respond_to?(:new)
p c009
p Symbol.respond_to?(:all_symbols)
c010 = Symbol.respond_to?(:all_symbols)
p c010
p Array.respond_to?(:instance_methods)
p Array.respond_to?(:instance_method)
c011 = Array.respond_to?(:instance_method)
p c011
p Comparable.respond_to?(:instance_method)
c012 = Comparable.respond_to?(:instance_method)
p c012

# a Thread / Mutex / Fiber class receiver answers too
p Thread.respond_to?(:new)
p Mutex.respond_to?(:new)
p Fiber.respond_to?(:yield)
c008 = Thread.respond_to?(:new)
p c008
