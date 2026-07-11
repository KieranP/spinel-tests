# frozen_string_literal: true
# Method#super_method
def dbl(n) = n * 2

class Animal
  def speak; "..."; end
end
class Dog < Animal
  def speak; "woof"; end
end

# super_method of an overriding method finds the parent's definition (a Method)
r001 = (Dog.new.method(:speak).super_method.class rescue $!.class); p r001
bm002 = Dog.new.method(:speak); r002 = (bm002.super_method.class rescue $!.class); p r002

# super_method on a top-level method front-end rejects
p(method(:dbl).super_method)
