# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct.new arity checking
Args143 = Struct.new(:x, :y)
r143 = (begin; Args143.new(1, 2, 3); "no error"; rescue ArgumentError; "argerror"; end); p r143

# double-splat keyword construction drops the Hash (all members come out nil)
hkw = { x: 1, y: 2 }
p(Point.new(**hkw))
# duplicate member name: Ruby raises ArgumentError, Spinel silently dedups
rdupS = (begin; kS = Struct.new(:z, :z); "members=#{kS.members}"; rescue ArgumentError; "argerror"; end); p rdupS

# fewer args than members => trailing members nil-filled
Few = Struct.new(:a, :b, :c)
p(Few.new(1).to_a)
vfew = Few.new(1, 2).to_a; p(vfew)

# block form: methods defined in the Struct.new block
Blk = Struct.new(:w, :h) do
  def area; w * h; end
end
p(Blk.new(3, 4).area)
vblk = Blk.new(3, 4); p(vblk.area)

# subclass form: class < Struct.new(...)
class Vec < Struct.new(:vx, :vy)
  def norm2; vx * vx + vy * vy; end
end
p(Vec.new(3, 4).norm2)
vvec = Vec.new(3, 4); p(vvec.to_a)

# subclassing a Struct held in a CONSTANT loses the members: the constructor
# takes no arguments, and a subclass method that reads a member aborts the build.
Base046 = Struct.new(:a, :b)
class Kid046 < Base046
end
r046 = (begin; Kid046.new(1, 2); "no error"; rescue ArgumentError; "argerror"; end); p r046
r047 = (Kid046.new.members rescue $!.class); p r047
Base048 = Struct.new(:a, :b)
class Kid048 < Base048
  def total = a + b
end
p Kid048.new(1, 2).total
Base049 = Struct.new(:a, :b)
class Kid049 < Base049
end
p Kid049.members

# keyword_init: true rejects positional arguments in CRuby; Spinel builds an
# instance from them. Runtime value difference, so these stay live.
KwPos050 = Struct.new(:a, :b, keyword_init: true)
r050 = (begin; KwPos050.new(1, 2); "no error"; rescue ArgumentError; "argerror"; end); p r050
r051 = (begin; KwPos050.new(1); "no error"; rescue ArgumentError; "argerror"; end); p r051

# string-named struct (Struct.new("Sn", ...) and the Struct::Sn path) is a documented by-design limitation
# WONTFIX: See docs/limitations.md - "By design — String-named Struct"
# SNamed = Struct.new("Sn", :a, :b)
# p(SNamed.new(1, 2).a)
# vsn = SNamed.new(1, 2); p(vsn.b)
# p(Struct::Sn.new(3, 4).b)

# keyword_init: true — unknown keyword should raise ArgumentError
KwNew = Struct.new(:a, :b, keyword_init: true)
p(KwNew.new(a: 1, b: 2).to_h)
vkwn = KwNew.new(b: 9); p(vkwn.a)
rkw = (begin; KwNew.new(a: 1, z: 9); "no error"; rescue ArgumentError => ekw; ekw.class; end); p rkw

# An empty array literal for a field whose other call site passes a String array
# emits ill-typed C (sp_IntArray* -> sp_StrArray*). stdout MATCHES, so these
# lines stay LIVE — the C warning is the bug.
S682 = Struct.new(:name, :deps)
sa682 = S682.new("x", ["d1"])
sb682 = S682.new("y", [])
p [sa682.deps, sb682.deps]
sv682 = sb682.deps; p sv682
