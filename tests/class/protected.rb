# frozen_string_literal: true
class C001
  def initialize(n); @n = n; end
  def bigger?(other); n > other.n; end
  protected
  def n; @n; end
end

# Module#protected (visibility set in class body; protected call between instances works)
a001 = C001.new(5)
b001 = C001.new(3)
p(a001.bigger?(b001))
v001 = a001.bigger?(b001); p v001
# Method privacy is unenforced in Spinel: an external call to a protected method
# succeeds where CRuby raises NoMethodError.
# WONTFIX: unenforced method privacy (see CLAUDE.md known unsupported list)
# r001 = (a001.n rescue $!.class); p r001
