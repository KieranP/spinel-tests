# frozen_string_literal: true
# Object#singleton_class
o001 = Object.new
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# p(o001.singleton_class.class)
# v001 = o001.singleton_class; p v001.class
# p("x".singleton_class.class)
