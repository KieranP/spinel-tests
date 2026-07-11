# frozen_string_literal: true
module Walks001; end
class Animal001; end
class Dog001 < Animal001; include Walks001; end

# Class#ancestors
p(Dog001.ancestors)
v001 = Dog001.ancestors; p v001
p(Animal001.ancestors.include?(Object))
v002 = Animal001.ancestors; p v002.include?(Object)
c001 = Dog001
p(c001.ancestors.first)
v003 = c001.ancestors; p v003.first

# the last-included module sits nearest the class, ahead of earlier includes
module Mod001; end
module Mod002; end
class Multi001; include Mod001; include Mod002; end
p(Multi001.ancestors)
v004 = Multi001.ancestors; p v004
p(Multi001.ancestors.index(Mod002) < Multi001.ancestors.index(Mod001))

# a subclass's ancestry is its own entries followed by the superclass's
class Sub001 < Multi001; end
p(Sub001.ancestors)
v005 = Sub001.ancestors; p v005
p(Sub001.ancestors.first)

# a module's own ancestors, and a module that includes another module
module Outer001; include Mod001; end
p(Mod001.ancestors)
p(Outer001.ancestors)
v006 = Outer001.ancestors; p v006
# the built-in modules are correct
p(Comparable.ancestors)
p(Enumerable.ancestors)

# built-in ancestries
p(Integer.ancestors.include?(Comparable))
p(String.ancestors.include?(Comparable))
p(Array.ancestors.include?(Enumerable))
p(BasicObject.ancestors)
v007 = BasicObject.ancestors; p v007
p(Object.ancestors)

# untyped, so chaining map raises NoMethodError
class AncA950; end
class AncB950; end
[AncA950, AncB950].each { |k950| p k950.ancestors.map { |m950| m950.name.to_s } }
r951 = [AncA950, AncB950].map { |k951| k951.ancestors.map { |m951| m951.name.to_s } }; p r951
