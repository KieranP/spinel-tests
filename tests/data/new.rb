# frozen_string_literal: true
Point = Data.define(:x, :y)

# Data.new
# positional
p(Point.new(1, 2))
v001 = Point.new(1, 2); p(v001)
# keyword
p(Point.new(x: 3, y: 4))
v002 = Point.new(x: 3, y: 4); p(v002)
# keyword order-independent
p(Point.new(y: 6, x: 5))
v003 = Point.new(y: 6, x: 5); p(v003)

# argument validation (Ruby raises ArgumentError; Spinel builds an instance instead)
r004 = (begin; Point.new(1); "no error"; rescue ArgumentError; "argerror"; end); p r004
r005 = (begin; Point.new; "no error"; rescue ArgumentError; "argerror"; end); p r005
r006 = (begin; Point.new(x: 1, y: 2, z: 3); "no error"; rescue ArgumentError; "argerror"; end); p r006
r007 = (begin; Point.new(1, y: 2); "no error"; rescue ArgumentError; "argerror"; end); p r007
# too many positional arguments IS rejected (matches Ruby)
r008 = (begin; Point.new(1, 2, 3); "no error"; rescue ArgumentError; "argerror"; end); p r008

# double-splat keyword construction
h009 = { x: 8, y: 9 }
p(Point.new(**h009))
v009 = Point.new(**h009); p(v009)

arr010 = [1, 2]
r010 = (Point.new(*arr010) rescue $!.class); p r010

# An empty array literal for a field whose other call site passes a String array
# emits ill-typed C (sp_IntArray* -> sp_StrArray*). stdout MATCHES, so these
# lines stay LIVE — the C warning is the bug.
P682 = Data.define(:name, :deps)
a682 = P682.new(name: "x", deps: ["d1"])
b682 = P682.new(name: "y", deps: [])
p [a682.deps, b682.deps]
v682 = b682.deps; p v682
