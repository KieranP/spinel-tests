# frozen_string_literal: true
# Kernel#remove_instance_variable
class Box090
  def initialize; @v = 1; end
  def drop; remove_instance_variable(:@v); end
end
p(Box090.new.drop)
v090 = Box090.new.drop; p v090
