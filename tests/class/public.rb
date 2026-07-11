# frozen_string_literal: true
class C001
  private
  def was_priv; 11; end
  public :was_priv
end

# Module#public (re-publicizing a method in the class body)
o001 = C001.new
p(o001.was_priv)
v001 = o001.was_priv; p v001
