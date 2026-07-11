# frozen_string_literal: true
# Kernel#respond_to?
p(Object.new.respond_to?(:inspect))
p(Object.new.respond_to?(:definitely_not_a_method_xyz))
a020 = Object.new; p(a020.respond_to?(:inspect))
a021 = Object.new; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021
p("x".respond_to?("upcase"))
class Priv022; private def sekret022; end; end
p(Priv022.new.respond_to?(:sekret022))
p(Priv022.new.respond_to?(:sekret022, true))
a022 = Priv022.new; v022 = a022.respond_to?(:sekret022, true); p v022

# protected methods answer like private ones; builtins answer for their own methods
class Prot023
  def pub023; :pub; end
  private def priv023; :priv; end
  protected def prot023; :prot; end
end
a023 = Prot023.new
p(a023.respond_to?(:pub023))
p(a023.respond_to?(:priv023))
p(a023.respond_to?(:priv023, true))
p(a023.respond_to?(:prot023))
p(a023.respond_to?(:prot023, true))
v023 = a023.respond_to?(:pub023, false); p v023
p(nil.respond_to?(:to_a))
p(1.respond_to?(:+))
p([].respond_to?(:each))
p("s".respond_to?(:nonexistent_zzz))
v024 = 1.respond_to?(:nonexistent_zzz); p v024
