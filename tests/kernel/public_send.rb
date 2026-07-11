# frozen_string_literal: true
# Kernel#public_send
p(5.public_send(:+, 3))
v331 = 5.public_send(:+, 3); p v331
p("x".public_send(:upcase))
a332 = :size; b332 = [1, 2, 3]; v332 = b332.public_send(a332); p v332

# public_send refuses private and protected methods
class Vis333
  def pub333; :pub; end
  private def priv333; :priv; end
  protected def prot333; :prot; end
end
a333 = Vis333.new
p(a333.public_send(:pub333))
v333 = a333.public_send(:pub333); p v333
r333 = (a333.public_send(:priv333) rescue $!.class); p r333
r334 = (a333.public_send(:prot333) rescue $!.class); p r334
p([1, 2, 3].public_send(:map) { |x| x * 2 })
v335 = { a: 1 }.public_send(:fetch, :a); p v335
