# frozen_string_literal: true
# Class#attached_object
o001 = Object.new
# attached_object is only reachable via a singleton class, but Spinel rejects both
# Object#singleton_class and the `class << obj` singleton-class node.
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# sc001 = o001.singleton_class; p(sc001.attached_object.equal?(o001))
# p(String.singleton_class.attached_object)
