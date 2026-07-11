# frozen_string_literal: true
class C001
  def pub; priv; end
  def priv; 42; end
  private :priv
end

# Module#private (visibility set in class body; internal call works)
o001 = C001.new
p(o001.pub)
v001 = o001.pub; p v001
# Method privacy is unenforced in Spinel: an external call to a private method
# succeeds where CRuby raises NoMethodError.
# WONTFIX: unenforced method privacy (see CLAUDE.md known unsupported list)
# r001 = (o001.priv rescue $!.class); p r001
