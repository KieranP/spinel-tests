# frozen_string_literal: true
class BOhook < BasicObject
  def initialize
    @n = 0
  end
  # BasicObject#singleton_method_undefined is a private hook invoked when a singleton
  # method is undefined on the object (via `undef_method` on its singleton class).
  # Defining the hook and ordinary instance methods compiles fine; the hook simply
  # never has occasion to fire below (a singleton method must first exist to undef).
  def singleton_method_undefined(name)
    ::Kernel.puts("undefined: #{name}")
  end
  def regular
    42
  end
end

# BasicObject#singleton_method_undefined
# Defining a regular instance method does not trigger the singleton hook, so the
# object behaves normally.
a001 = BOhook.new; p(a001.regular)
a002 = BOhook.new; v001 = (a002.regular); p v001

# The hook can only fire when a *singleton* method is undefined on the object, but
# singleton-method definition itself is unsupported and aborts compilation, so the
# hook is unobservable:
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# def a001.extra; 1; end
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# class << a001; undef_method(:extra); end
