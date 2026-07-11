# frozen_string_literal: true
# NoMethodError#private_call?
# a naturally-raised NoMethodError from a public call is not a private call
begin; nil.foo; rescue NoMethodError => e001; p e001.private_call?; end
p001 = (begin; nil.foo; rescue NoMethodError => e002; e002.private_call?; end); p p001
# the explicit constructor's 4th positional argument sets the private-call flag
p(NoMethodError.new("m", :nm, [1], true).private_call?)
p002 = NoMethodError.new("m", :nm, [1], true).private_call?; p p002

# a call to a private method: Ruby raises NoMethodError with private_call? true
class Priv003
  def pub; 1; end
  private
  def hidden; 2; end
end
o003 = Priv003.new
# WONTFIX: See docs/limitations.md - "By design — Intentional incompatibilities with CRuby" (unenforced method privacy)
# p(begin; o003.hidden; rescue NoMethodError => e003; e003.private_call?; end)
p o003.pub
