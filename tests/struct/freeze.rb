# frozen_string_literal: true
# Struct#freeze
Frz310 = Struct.new(:a)

x310 = Frz310.new(1); x310.freeze; p x310.frozen?
p(Frz310.new(2).freeze.frozen?)

# a frozen Struct's setters raise FrozenError (statement form, wrapped so the file continues)
Fs311 = Struct.new(:x, :y)
f311 = Fs311.new(1, 2).freeze
rstmt = (begin; f311.x = 5; "no error"; rescue => e311; e311.class; end); p rstmt
g311 = Fs311.new(1, 2).freeze
ristmt = (begin; g311[0] = 5; "no error"; rescue => e312; e312.class; end); p ristmt

# same writes in value context (assignment result captured)
h311 = Fs311.new(1, 2).freeze
rval = (begin; w311 = (h311.x = 5); "assigned #{w311}"; rescue => e313; e313.class; end); p rval
k311 = Fs311.new(1, 2).freeze
rival = (begin; w312 = (k311[0] = 5); "assigned #{w312}"; rescue => e314; e314.class; end); p rival
