# frozen_string_literal: true
# Exception#to_s
p(RuntimeError.new("boom").to_s)
s001 = RuntimeError.new("boom").to_s; p s001

# default to_s is the class name
p(ArgumentError.new.to_s)
s002 = ArgumentError.new.to_s; p s002

# subclass with a message
p(ZeroDivisionError.new("z").to_s)
s003 = ZeroDivisionError.new("z").to_s; p s003

# to_s of a rescued exception
begin; raise "raised"; rescue => e004; p e004.to_s; end
s005 = (begin; raise "raised"; rescue => e005; e005.to_s; end); p s005

# a subclass whose #to_s returns a non-String (kept commented: it aborts the C build)
class SymToS006 < StandardError
  def to_s; :sym; end
end
p(SymToS006.new.to_s)
s006 = SymToS006.new.to_s; p s006

# a subclass whose #to_s returns a String is read through by #message
class StrToS007 < StandardError
  def to_s; "via-to_s"; end
end
p(StrToS007.new.to_s)
s007 = StrToS007.new("ignored").to_s; p s007
