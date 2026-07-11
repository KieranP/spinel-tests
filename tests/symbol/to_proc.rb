# frozen_string_literal: true
# Symbol#to_proc
p(["a", "bb", "ccc"].map(&:length))
v014 = (["a", "bb", "ccc"].map(&:length)); p v014
p(:upcase.to_proc.call("hi"))
v015 = (:upcase.to_proc.call("hi")); p v015
p([:hello, :world].map(&:upcase))
v016 = ([:hello, :world].map(&:upcase)); p v016
a026 = :upcase; c026 = (a026.to_proc.call("hi")); p c026
b026 = :upcase; p(["a", "b"].map(&b026))
v017 = (["a", "b"].map(&b026)); p v017
# &:sym across a range of Enumerable methods
p([1, 2, 3, 4].select(&:even?))
v018 = ([1, 2, 3, 4].select(&:even?)); p v018
p([1, 2, 3, 4].reject(&:odd?))
v019 = ([1, 2, 3, 4].reject(&:odd?)); p v019
p([1, 2, 3, 4].count(&:even?))
v020 = ([1, 2, 3, 4].count(&:even?)); p v020
p([2, 4, 6].all?(&:even?))
v021 = ([2, 4, 6].all?(&:even?)); p v021
p([1, 2, 3, 4].partition(&:even?))
v022 = ([1, 2, 3, 4].partition(&:even?)); p v022
p([:bb, :a, :ccc].sort_by(&:length))
v023 = ([:bb, :a, :ccc].sort_by(&:length)); p v023
p([1, 2, 3, 4].reduce(&:+))
v024 = ([1, 2, 3, 4].reduce(&:+)); p v024
# literal built-in operator symbol as a proc (receiver + arg) works
p(:+.to_proc.call(2, 3))
v025 = (:+.to_proc.call(2, 3)); p v025
a027 = :+; c027 = (a027.to_proc.call(4, 5) rescue $!.class); p c027
v028 = (:pow.to_proc.call(2, 3) rescue $!.class); p v028
# to_proc result class, and single-arg (receiver-only) call on an object
p(:upcase.to_proc.class)
v026 = (:upcase.to_proc.class); p v026
p(:length.to_proc.call("hello"))
v027 = (:length.to_proc.call("hello")); p v027

# the unary-operator symbols as a block argument
p([1, 2].map(&:-@))
w625 = [1, 2].map(&:+@); p w625
