# frozen_string_literal: true
# ensure
# ensure runs on the normal path
log001 = []
begin
  log001 << :body
ensure
  log001 << :ensure
end
p log001

# ensure runs on the exception path, then the exception propagates
log002 = []
begin
  begin
    log002 << :body
    raise "boom"
  ensure
    log002 << :ensure
  end
rescue => e002
  log002 << e002.message
end
p log002

# ensure runs even when a rescue handles the error
log003 = []
begin
  raise ArgumentError, "a"
rescue => e003
  log003 << :rescued
ensure
  log003 << :ensure
end
p log003

# a value returned from the body is preserved despite ensure
def m004
  return 42
ensure
  nil
end
p m004

# ensure runs in a method that raises, before the error propagates
order005 = []
def m005(order)
  raise TypeError, "t"
ensure
  order << :ensure005
end
begin; m005(order005); rescue => e005; order005 << e005.class.to_s; end
p order005

# ensure value does not override the block value
v006 = begin
  :body_val
ensure
  :ensure_val
end
p v006

# ensure runs when a block exits via break
log007 = []
[1, 2, 3].each do |i|
  begin
    log007 << i
    break if i == 2
  ensure
    log007 << :"e#{i}"
  end
end
p log007

# ensure runs when a block exits via next
log008 = []
[1, 2].each do |i|
  begin
    next
  ensure
    log008 << i
  end
end
p log008

# ensure runs on a return out of a method taken from inside a block
def finder009(log)
  [1, 2, 3].each do |i|
    begin
      return i if i == 2
    ensure
      log << :"ens#{i}"
    end
  end
  nil
end
log009 = []
p finder009(log009); p log009

# an ensure that returns swallows the in-flight exception
def swallow010
  raise "boom"
ensure
  return :from_ensure
end
p swallow010
v010 = swallow010; p v010

# an ensure that raises replaces the in-flight exception
def replace011
  raise ArgumentError, "orig"
ensure
  raise TypeError, "from-ensure"
end
begin; replace011; rescue => e011; p [e011.class.to_s, e011.message]; end
r011 = (begin; replace011; rescue => x011; x011.message; end); p r011

# ensure ordering across a method chain
def inner012(log); log << :inner_begin; raise ArgumentError, "deep"; ensure; log << :inner_ensure; end
def outer012(log); inner012(log); ensure; log << :outer_ensure; end
log012 = []
begin; outer012(log012); rescue => e012; log012 << e012.message; end
p log012

# ensure runs while a throw unwinds the block
log013 = []
v013 = catch(:t) do
  begin
    throw :t, :thrown
  ensure
    log013 << :ensure
  end
end
p v013; p log013

# a def-level rescue and ensure together
def handled014
  raise ArgumentError, "x"
rescue ArgumentError => e
  "rescued:#{e.message}"
ensure
  nil
end
p handled014
v014 = handled014; p v014
