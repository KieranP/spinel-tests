# frozen_string_literal: true
# Kernel#singleton_class
# p(Object.new.singleton_class.class)              # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# s080 = Object.new.singleton_class; p s080.class  # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
