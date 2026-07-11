# frozen_string_literal: true
# Kernel#singleton_method
# o082 = Object.new
# def o082.hi; 1; end
# p(o082.singleton_method(:hi).call)                # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# m082 = o082.singleton_method(:hi); p m082.call    # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
