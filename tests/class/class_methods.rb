# frozen_string_literal: true
class Reg001
  def self.build; "self.build"; end
  class << self
    def make; "singleton.make"; end
    def chained; "chained:" + make; end
  end
  def self.count; @@n001 ||= 0; end
  @@n001 = 3
  def self.bump; @@n001 += 1; end
end

# Class — class-method definition forms (def self.m, class << self, extend)
p(Reg001.build)
v001 = Reg001.build; p v001
p(Reg001.make)
v002 = Reg001.make; p v002
p(Reg001.chained)
v003 = Reg001.chained; p v003
p(Reg001.count)
Reg001.bump
p(Reg001.count)
p(Reg001.respond_to?(:build))
p(Reg001.respond_to?(:make))
p(Reg001.respond_to?(:nope001))

# a class method is inherited by a subclass and can be overridden with super
class Kid001 < Reg001
  def self.build; "kid(" + super + ")"; end
end
p(Kid001.make)
p(Kid001.build)
v004 = Kid001.build; p v004

# `extend Mod` in a class body turns the module's instance methods into class methods
module Fac001
  def create(n); new(n); end
  def kind; "factory"; end
end
class Prod001
  extend Fac001
  attr_reader :n
  def initialize(n); @n = n; end
end
p(Prod001.kind)
v005 = Prod001.kind; p v005
p(Prod001.create(4).n)
v006 = Prod001.create(5); p v006.n
p(Prod001.respond_to?(:kind))
p(Prod001.new(1).respond_to?(:kind))

# a singleton method on a single object (def obj.m) coexists with the class's own
class Plain001; def base; 1; end; end
o001 = Plain001.new
def o001.extra; 99; end
p(o001.extra)
v007 = o001.extra; p v007
p(o001.base)
p(o001.respond_to?(:extra))
p(Plain001.new.respond_to?(:extra))

# Adding a singleton method to a live object through the reflective API, or
# reaching its singleton class, is unsupported:
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# o002 = Plain001.new; o002.define_singleton_method(:dsm) { 7 }; p o002.dsm
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# p(o001.singleton_class.class)
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#extend(mod)"
# o003 = Plain001.new; o003.extend(Fac001); p o003.kind
