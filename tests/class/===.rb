# frozen_string_literal: true
class Animal001; end
class Dog001 < Animal001; end

# Class#===
p(Integer === 5)
v001 = (Integer === 5); p v001
p(String === "x")
v002 = (String === "x"); p v002
p(Numeric === 5)
v003 = (Numeric === 5); p v003
p(Integer === "x")
v004 = (Integer === "x"); p v004
# explicit === with a user-class receiver aborts compilation (case/when works)
d001 = Dog001.new
p(Animal001 === d001)
v005 = (Animal001 === d001); p v005

# a module receiver answers membership of the mixin
module Walks001; end
class Runner001 < Animal001; include Walks001; end
r001 = Runner001.new
p(Walks001 === r001)
v006 = (Walks001 === r001); p v006
p(Walks001 === d001)
module Never001; end
p(Never001 === r001)
v007 = (Never001 === r001); p v007

# built-in receivers with built-in arguments
p(Object === 5)
p(Object === "x")
p(Object === nil)
p(Comparable === 5)
p(Comparable === "x")
p(Enumerable === [1])
p(Kernel === [1])
v008 = (Object === 1.5); p v008

# a user-object argument on a BUILT-IN receiver raises NoMethodError, so these
# probes are rescue-wrapped; `Object === Object.new` answers false instead.
r002 = (Object === d001 rescue $!.class); p r002
r003 = (Kernel === d001 rescue $!.class); p r003
r004 = (Comparable === d001 rescue $!.class); p r004
r005 = (Enumerable === d001 rescue $!.class); p r005
p(Object === Object.new)
v009 = (Object === Object.new); p v009
