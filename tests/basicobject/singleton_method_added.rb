# frozen_string_literal: true
class BOhook < BasicObject
  def initialize
    @log = []
  end
  # BasicObject#singleton_method_added is a private hook invoked when a singleton
  # method is defined on the object (likewise #singleton_method_removed and
  # #singleton_method_undefined). Defining the hook and ordinary instance methods
  # compiles fine; the hook simply never has occasion to fire below.
  def singleton_method_added(name)
    ::Kernel.puts("added: #{name}")
  end
  def regular
    42
  end
end

# BasicObject#singleton_method_added
# Defining a regular instance method does not trigger the singleton hook, so the
# object behaves normally.
a001 = BOhook.new; p(a001.regular)
a002 = BOhook.new; v001 = (a002.regular); p v001

# The hook can only fire when a *singleton* method is defined on the object, but
# singleton-method definition itself is unsupported and aborts compilation, so the
# hook is unobservable. These stay commented (the same applies to
# #singleton_method_removed and #singleton_method_undefined):
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# def a001.extra; 1; end
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# a001.define_singleton_method(:extra) { 1 }
