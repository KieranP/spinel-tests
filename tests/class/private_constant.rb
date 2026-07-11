# frozen_string_literal: true
class C001
  X001 = 1
  private_constant :X001
  def get; X001; end
end

# Module#private_constant (declarative; internal access works)
o001 = C001.new
p(o001.get)
v001 = o001.get; p v001
# External access to a private constant raises NameError in CRuby; unenforced in Spinel.
# WONTFIX: unenforced constant privacy (see CLAUDE.md known unsupported list)
# r001 = (C001::X001 rescue $!.class); p r001
