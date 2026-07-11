# frozen_string_literal: true
module M001; def hi; 9; end; end
class C001; include M001; end

# Class#include (declarative, in class body)
o001 = C001.new
p(o001.hi)
v001 = o001.hi; p v001
p(C001.ancestors.include?(M001))
v002 = C001.ancestors; p v002.include?(M001)

# a module's constants are reachable from the including class's methods
module Cfg001
  LIMIT001 = 5
  def limit; LIMIT001; end
end
class Host001; include Cfg001; end
p(Host001.new.limit)
v003 = Host001.new.limit; p v003
p(Host001.const_defined?(:LIMIT001))
v004 = Host001.const_get(:LIMIT001); p v004

# including two modules puts the LAST one first in the ancestry
module First001; def who; "first"; end; end
module Second001; def label; "second"; end; end
class Both001; include First001; include Second001; end
p(Both001.ancestors)
v005 = Both001.ancestors; p v005
p(Both001.included_modules)
p(Both001.new.who)
p(Both001.new.label)

# when both modules define the SAME method, CRuby dispatches the last include
module Dup001; def tag; "dup1"; end; end
module Dup002; def tag; "dup2"; end; end
class Clash001; include Dup001; include Dup002; end
p(Clash001.ancestors)
p(Clash001.new.tag)
v006 = Clash001.new.tag; p v006

# a module included into a superclass is inherited by the subclass
module Base001; def shared; "shared"; end; end
class Up001; include Base001; end
class Down001 < Up001; end
p(Down001.new.shared)
v007 = Down001.new.shared; p v007
p(Down001.ancestors.include?(Base001))
p(Down001.include?(Base001))

# Calling include at runtime with an explicit receiver is rejected:
# class D001; end
# WONTFIX: See docs/limitations.md - "Fundamental limits — Runtime structural mutation of a class through an explicit receiver"
# D001.include(M001); p(D001.new.hi)
