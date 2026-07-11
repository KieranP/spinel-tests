# frozen_string_literal: true
# NilClass#clone
p(nil.clone.class)
v046 = nil.clone; p(v046.class)
a046 = nil; p(a046.clone.equal?(a046))
a047 = nil; b047 = a047.clone; p(b047.nil?)

# clone(freeze: true/nil) — literal receiver returns nil (no unfreeze), matches CRuby.
p(nil.clone(freeze: true).nil?)
p(nil.clone(freeze: nil).nil?)
r048 = (begin; nil.clone(freeze: true).class; rescue Exception => e048; e048.class; end)
p r048
v049 = nil.clone(freeze: true); p(v049.nil?)

# clone(freeze:) on a variable-typed nil receiver is rejected at compile time.
a050 = nil; p(a050.clone(freeze: true).nil?)

# nil.clone(freeze: false) raises ArgumentError in Ruby; in a rescue whose value is
# Class-typed the C build aborts (ill-typed merge).
r051 = (nil.clone(freeze: false) rescue $!.class); p r051
