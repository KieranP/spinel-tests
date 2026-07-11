# frozen_string_literal: true
# Exception#message
p(RuntimeError.new("boom").message)
m001 = RuntimeError.new("boom").message; p m001

# default message is the class name
p(ArgumentError.new.message)
m002 = ArgumentError.new.message; p m002

# Exception.new with no argument
p(Exception.new.message)
m003 = Exception.new.message; p m003

# explicit nil argument also falls back to the class name
p(RuntimeError.new(nil).message)
m004 = RuntimeError.new(nil).message; p m004

# a raised exception's message, read inside the rescue
begin; raise "raised"; rescue => e005; p e005.message; end
m006 = (begin; raise "raised"; rescue => e006; e006.message; end); p m006

# raising a class alone uses the default (class name) message
begin; raise TypeError; rescue => e007; p e007.message; end

# message and to_s agree
a008 = ZeroDivisionError.new("z"); p(a008.message == a008.to_s)

# custom StandardError subclass carries the given message
class MyErr009 < StandardError; end
begin; raise MyErr009, "custom"; rescue => e009; p e009.message; end
m010 = (begin; raise MyErr009, "custom"; rescue => e010; e010.message; end); p m010

# subclass overriding #message
class MsgOver011 < StandardError
  def message; "overridden!"; end
end
begin; raise MsgOver011; rescue => e011; p e011.message; end
m012 = (begin; raise MsgOver011; rescue => e012; e012.message; end); p m012

# subclass overriding #to_s (message reads through to_s)
class ToSOver013 < StandardError
  def to_s; "via-to_s"; end
end
begin; raise ToSOver013; rescue => e013; p e013.message; end

# subclass with a custom initialize that calls super with a fixed message
class Init014 < StandardError
  def initialize; super("fixed-msg"); end
end
begin; raise Init014; rescue => e014; p e014.message; end
m015 = (begin; raise Init014; rescue => e015; e015.message; end); p m015

e016 = (begin; raise "z"; rescue => x016; x016; end); p e016.message

# a subclass whose #to_s returns a non-String: Ruby's #message answers it unchanged
class SymToS017 < StandardError
  def to_s; :sym; end
end
p(SymToS017.new.message)
m018 = SymToS017.new.message; p m018
m019 = (raise SymToS017 rescue $!.message); p m019
