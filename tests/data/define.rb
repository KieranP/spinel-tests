# frozen_string_literal: true
# Data.define
# returns a Class
k001 = Data.define(:x, :y); p(k001.class)
v001 = Data.define(:x, :y); p(v001.class)
# a method chained directly onto the inline Data.define result aborts compilation
p(Data.define(:x, :y).class)
a002 = Data.define(:x, :y).new(1, 2); p a002

# with a block adding instance methods
Vec = Data.define(:x, :y) do
  def sum
    x + y
  end
end
p(Vec.new(3, 4).sum)
v002 = Vec.new(3, 4).sum; p(v002)

# with a block overriding initialize (normalization idiom)
Norm = Data.define(:n) do
  def initialize(n:)
    super(n: n.abs)
  end
end
p(Norm.new(n: -5).n)
v005 = Norm.new(n: -5); p(v005.n)

# no members
Empty = Data.define
p(Empty.new)
v003 = Empty.new; p(v003)
p(Empty.members)
v004 = Empty.members; p(v004)

# duplicate member name: Ruby raises ArgumentError, Spinel silently dedups
rdup = (begin; kdup = Data.define(:d, :d); "members=#{kdup.members}"; rescue ArgumentError; "argerr"; end); p rdup

syms010 = [:sx, :sy, :sz]
Ksplat = Data.define(*syms010)
p(Ksplat.members)
v010 = Ksplat.members; p(v010)
DML060 = Data.define
r060 = (begin; case DML060.new; in DML060 then :matched; end; rescue NoMatchingPatternError => e060; e060.class; end); p r060
v061 = (begin; case DML060.new; in DML060 then :matched; end; rescue NoMatchingPatternError => e061; e061.class; end); p v061
