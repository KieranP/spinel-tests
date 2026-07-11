# frozen_string_literal: true
# NilClass#nil?
p(nil.nil?)
v010 = (nil.nil?); p v010
n009 = nil; p(n009.nil?)
v011 = (n009.nil?); p v011
# nil?.nil? chained; non-nil for contrast
p(0.nil?)
p("".nil?)
p([].nil?)
# nil flowing through a container, probed with nil?
arr012 = [1, nil, 2, nil, 3]
p(arr012.count(&:nil?))
p(arr012[1].nil?)
p(arr012.compact.any?(&:nil?))
# nil-or-value method result probed with nil?
def maybe013(b); b ? 7 : nil; end
r013a = maybe013(false); p(r013a.nil?)
r013b = maybe013(true); p(r013b.nil?)
# hash miss is nil
h014 = {a: 1}
p(h014[:z].nil?)
p(h014[:a].nil?)
# a constant assigned nil aborts the C build, so nil? on it cannot be reached.
# Kept commented: a compile abort takes down the whole file.
NIL_CONST015 = nil
p NIL_CONST015.nil?
v015 = NIL_CONST015.nil?; p v015
