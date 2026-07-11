# frozen_string_literal: true
class BOhook < BasicObject
  def initialize
    @n = 0
  end
  # BasicObject#singleton_method_removed is a private hook invoked when a singleton
  # method is removed from the object (via `remove_method` on its singleton class).
  # Defining the hook and ordinary instance methods compiles fine; the hook simply
  # never has occasion to fire below (a singleton method must first exist to remove).
  def singleton_method_removed(name)
    ::Kernel.puts("removed: #{name}")
  end
  def regular
    42
  end
end

# BasicObject#singleton_method_removed
# Removing nothing / defining a regular instance method does not trigger the
# singleton hook, so the object behaves normally.
a001 = BOhook.new; p(a001.regular)
a002 = BOhook.new; v001 = (a002.regular); p v001

# The hook can only fire when a *singleton* method is removed from the object, but
# singleton-method definition itself is unsupported and aborts compilation, so the
# hook is unobservable:
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# def a001.extra; 1; end
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# class << a001; remove_method(:extra); end
