# frozen_string_literal: true
# Kernel#extend
module Greet084
  def hi; "hi"; end
end
# o084 = Object.new
# o084.extend(Greet084)
# p(o084.hi)                                        # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#extend(mod)"
# v084 = o084.extend(Greet084).hi; p v084           # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#extend(mod)"
