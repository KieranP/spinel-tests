# frozen_string_literal: true
module M001; def hi; "M+" + super; end; end
class C001; prepend M001; def hi; "C"; end; end

# Class#prepend (declarative, in class body)
o001 = C001.new
p(o001.hi)
v001 = o001.hi; p v001
# a prepended module is omitted from #ancestors (dispatch above is correct)
p(C001.ancestors.first)
v002 = C001.ancestors; p v002.first

# a prepended module wins over the class's own method AND over an included one,
# and each link's super continues down the chain to the superclass
module Pre001; def tag; "pre(" + super + ")"; end; end
module Inc001; def tag; "inc"; end; end
class Base001; def tag; "base"; end; end
class Sub001 < Base001
  prepend Pre001
  include Inc001
  def tag; "sub(" + super + ")"; end
end
p(Sub001.new.tag)
v003 = Sub001.new.tag; p v003
p(Sub001.superclass)
p(Sub001.include?(Inc001))
p(Sub001.included_modules)

# prepending onto a class with no method of its own reaches the superclass
module Pre002; def name2; "P>" + super; end; end
class Up001; def name2; "up"; end; end
class Down001 < Up001; prepend Pre002; end
p(Down001.new.name2)
v004 = Down001.new.name2; p v004

# Calling prepend at runtime with an explicit receiver is rejected:
# class D001; def hi; "D"; end; end
# WONTFIX: See docs/limitations.md - "Fundamental limits — Runtime structural mutation of a class through an explicit receiver"
# D001.prepend(M001); p(D001.new.hi)

# modules defining the same method, while a sibling class that only prepends it runs it
module Rend950
  def render(text) = text
end
module Trim950
  def render(text) = super(text.strip)
end
module Brack950
  def render(text) = "[#{super}]"
end
module Shout950
  def render(text) = super.upcase
end
module Num950
  def initialize(*args)
    super()
    @counter = 0
  end
  def render(text)
    @counter += 1
    "#{@counter}. #{super}"
  end
end
class Loud950
  include Rend950
  include Trim950
  prepend Shout950
end
class Every950
  include Rend950
  include Trim950
  include Brack950
  include Num950
  prepend Shout950
end
p Loud950.new.render("  hi  ")
p Every950.new.render("  hi  ")
v951 = Every950.new.render("  hi  "); p v951
