# frozen_string_literal: true
# Exception.new
# String message
p(RuntimeError.new("boom").message)
n001 = RuntimeError.new("boom"); p n001.message

# no argument -> default (class name) message
p(Exception.new.class)
n002 = StandardError.new; p n002.message

# subclass construction
p(ArgumentError.new("bad").class)
n003 = TypeError.new("t"); p n003.class

# explicit nil message defaults to the class name (matches Ruby)
p(RuntimeError.new(nil).message)
n004 = RuntimeError.new(nil).message; p n004

# raising an exception instance directly preserves its message
a006 = ArgumentError.new("boom"); begin; raise a006; rescue => e006; p e006.message; end

# subclass that adds an attribute alongside the message
class Coded007 < StandardError
  attr_reader :code
  def initialize(code); @code = code; super("coded"); end
end
begin; raise Coded007.new(42); rescue => e007; p e007.code; p e007.message; end

p RuntimeError.new(42).message
p RuntimeError.new(:sym).message
class Msg008; def to_s; "objmsg"; end; end
p(begin; raise StandardError, Msg008.new; rescue => e008; e008.message; end)
