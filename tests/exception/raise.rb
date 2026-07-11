# frozen_string_literal: true
# Kernel#raise
# raise with a string builds a RuntimeError
begin; raise "boom"; rescue => e001; p e001.message; p e001.class; end
r001 = (begin; raise "boom"; rescue => x001; [x001.message, x001.class]; end); p r001

# raise with a class alone uses the default (class name) message
begin; raise ArgumentError; rescue => e002; p e002.message; p e002.class; end

# raise with class + message
begin; raise TypeError, "bad type"; rescue => e003; p e003.message; p e003.class; end

# raise with an exception instance preserves its message
inst004 = RangeError.new("out"); begin; raise inst004; rescue => e004; p e004.message; p e004.class; end

# bare raise re-raises the current exception inside a rescue
begin
  begin; raise "orig"; rescue; raise; end
rescue => e005
  p e005.message
end

# $! holds the current exception inside a rescue
begin; raise "current"; rescue; p $!.message; p $!.class; end

# $! is nil outside any rescue
p $!

# re-raise wrapping records the original as the cause
begin
  begin; raise "low"; rescue; raise StandardError, "high"; end
rescue => e006
  p e006.message
  p e006.cause.message
end

# raise inside a method propagates to the caller
def boom007; raise ArgumentError, "from method"; end
begin; boom007; rescue => e007; p e007.message; end

# StandardError rescue catches a RuntimeError
begin; raise "std"; rescue StandardError => e008; p e008.class; end

# a more specific rescue clause is chosen among several
begin; raise TypeError, "pick"; rescue ArgumentError => e009a; p :arg; rescue TypeError => e009b; p e009b.class; end

# raising a non-Exception value raises TypeError
r010 = (begin; raise 42; rescue TypeError => e010; e010.class; end); p r010
r011 = (begin; raise Object.new; rescue TypeError => e011; e011.class; end); p r011
# raising a class that is not an Exception subclass
r012 = (begin; raise String; rescue TypeError => e012; e012.class; end); p r012

# the three-argument form (class, message, backtrace) keeps the message
begin; raise ArgumentError, "three", []; rescue => e013; p e013.message; end
r013 = (begin; raise ArgumentError, "three", []; rescue => x013; x013.message; end); p r013

# raising an exception object that was already raised once
saved014 = (begin; raise ArgumentError, "once"; rescue => x014; x014; end)
begin; raise saved014; rescue => e014; p e014.message; end
r014 = (begin; raise saved014; rescue => x014b; x014b.class; end); p r014

# raise inside a block propagates out of the iterator
begin; [1, 2].each { |i| raise TypeError, "in-block" if i == 2 }; rescue => e015; p e015.message; end
r015 = (begin; [1, 2].each { |i| raise TypeError, "in-block" if i == 2 }; rescue => x015; x015.class; end); p r015

# raise from a lambda, rescued at the call site
l016 = ->(x) { raise ArgumentError, "l#{x}" }
begin; l016.call(1); rescue => e016; p e016.message; end
r016 = (begin; l016.call(2); rescue => x016; x016.message; end); p r016

# bare raise with no exception in flight raises RuntimeError with an empty message
r017 = (begin; raise; rescue RuntimeError => e017; [e017.class.to_s, e017.message]; end); p r017
