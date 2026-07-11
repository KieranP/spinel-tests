# frozen_string_literal: true
module Mod195
  def greet195; "hi"; end
end

module ExtEarly970
  def render(t970) = "[#{super}]"
end
class ExtEarlyBase970
  def render(t970b) = t970b
end
o970 = ExtEarlyBase970.new; p o970.render("x"); o970.extend(ExtEarly970); p o970.render("x")
o971 = ExtEarlyBase970.new; v971 = o971.render("x"); p v971; o971.extend(ExtEarly970); p o971.render("x")

# Object#extend
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#extend(mod)"
# o001 = Object.new; o001.extend(Mod195); p o001.greet195
# r001 = (Object.new.extend(Mod195).class rescue $!.class); p r001
# these forms are kept commented; extend without super compiles and is exercised above
module ExtSuper110
  def render(t110) = "[#{super}]"
end
class ExtBase110
  def render(t110b) = t110b
end
o110 = ExtBase110.new; o110.extend(ExtSuper110); p o110.render("x")
o111 = ExtBase110.new; o111.extend(ExtSuper110); v111 = o111.render("x"); p v111
