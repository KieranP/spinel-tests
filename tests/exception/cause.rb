# frozen_string_literal: true
# Exception#cause
# an exception raised while handling another records the first as its cause
begin
  begin; raise "inner"; rescue; raise "outer"; end
rescue => e001
  p e001.cause.class
  p e001.cause.message
end

# top-level exception has no cause
begin; raise "solo"; rescue => e002; p e002.cause; end
c003 = (begin; raise "solo"; rescue => e003; e003.cause; end); p c003.inspect

# explicit cause: keyword
begin
  raise "wrapper", cause: ArgumentError.new("deep")
rescue => e004
  p e004.cause.class
end

c005 = (begin; begin; raise "inner"; rescue; raise "outer"; end; rescue => e005; e005.cause; end); p c005.message

# three-level implicit cause chain
begin
  begin
    begin; raise "level1"; rescue; raise "level2"; end
  rescue
    raise "level3"
  end
rescue => e006
  p e006.message
  p e006.cause.message
  p e006.cause.cause.message
end

# explicit cause: nil suppresses the implicit cause
begin
  begin; raise "implicit"; rescue; raise RuntimeError, "top", cause: nil; end
rescue => e007
  p e007.cause
end

# a custom exception subclass records its cause too
class CauseErr008 < StandardError; end
begin
  begin; raise ArgumentError, "deep"; rescue; raise CauseErr008, "shallow"; end
rescue => e008
  p e008.cause.class
  p e008.cause.message
end

# an exception raised in an ensure records the in-flight one as its cause
r009 = (begin
  begin
    raise ArgumentError, "orig"
  ensure
    raise TypeError, "in-ensure"
  end
rescue => e009
  [e009.class.to_s, e009.cause.class.to_s]
end); p r009

# a wrapper method that re-raises records the block's exception as the cause
def wrap010
  yield
rescue => e
  raise RuntimeError, "wrapped"
end
begin; wrap010 { raise ArgumentError, "deep" }; rescue => e010; p [e010.message, e010.cause.class.to_s]; end

# a bare re-raise keeps the cause it already had
r011 = (begin
  begin
    begin; raise ArgumentError, "a"; rescue; raise TypeError, "b"; end
  rescue
    raise
  end
rescue => e011
  [e011.class.to_s, e011.cause.class.to_s]
end); p r011

# cause of an exception raised outside any handler is nil
r012 = (begin; raise ArgumentError, "solo"; rescue => e012; e012.cause; end); p r012

# reading #cause off an instance of a user-defined subclass (kept commented:
# the call is refused at compile time, which aborts the file)
class CauseSub013 < StandardError; end
p(CauseSub013.new("m").cause)
# the same class read through a rescue clause resolves
begin; raise CauseSub013, "m"; rescue => e013; p e013.cause; end

# #cause read through a rescue clause typed by a built-in class
r014 = (begin; begin; raise ArgumentError, "in"; rescue; raise TypeError, "out"; end; rescue TypeError => e014; e014.cause.message; end); p r014
p(begin; begin; raise ArgumentError, "in"; rescue; raise TypeError, "out"; end; rescue TypeError => e015; e015.cause.class; end)
