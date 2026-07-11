# frozen_string_literal: true
# FrozenError#class
# Also exercises the core semantics: mutating a frozen object raises FrozenError.
# (The frozen-mutation cases are rescue-wrapped probes and so stay single-form.)
ClsStruct = Struct.new(:x)

# constructed instance
p(FrozenError.new("m").class)
k001 = FrozenError.new("m").class; p k001

# --- mutating a frozen object raises FrozenError (these all agree) ---
# frozen String << / concat / []= / clear
p(begin; "s".freeze << "x"; rescue => e002; e002.class; end)
p(begin; s003 = "abc".freeze; s003.concat("z"); rescue => e003; e003.class; end)
p(begin; s004 = "abc".freeze; s004[0] = "z"; rescue => e004; e004.class; end)
p(begin; s005 = "abc".freeze; s005.clear; rescue => e005; e005.class; end)
# frozen Array << / push / []= / pop / clear / delete / concat
p(begin; [1, 2].freeze << 3; rescue => e006; e006.class; end)
p(begin; a007 = [1].freeze; a007.push(2); rescue => e007; e007.class; end)
p(begin; a008 = [1].freeze; a008[0] = 9; rescue => e008; e008.class; end)
p(begin; a009 = [1, 2].freeze; a009.pop; rescue => e009; e009.class; end)
p(begin; a010 = [1, 2].freeze; a010.clear; rescue => e010; e010.class; end)
p(begin; a011 = [1, 2].freeze; a011.delete(1); rescue => e011; e011.class; end)
# frozen Hash []= / store
p(begin; h012 = {a: 1}.freeze; h012[:b] = 2; rescue => e012; e012.class; end)
p(begin; h013 = {a: 1}.freeze; h013.store(:b, 2); rescue => e013; e013.class; end)
# frozen Struct member set
p(begin; st014 = ClsStruct.new(1).freeze; st014.x = 5; rescue => e014; e014.class; end)

# --- frozen Hash delete/clear/merge! should also raise FrozenError ---
p(begin; h015 = {a: 1}.freeze; h015.delete(:a); rescue => e015; e015.class; end)
p(begin; h016 = {a: 1}.freeze; h016.clear; rescue => e016; e016.class; end)
p(begin; h017 = {a: 1}.freeze; h017.merge!({b: 2}); rescue => e017; e017.class; end)

# --- frozen String in-place mutators should also raise FrozenError ---
p(begin; s018 = "abc".freeze; s018.upcase!; rescue => e018; e018.class; end)
p(begin; s019 = "abc".freeze; s019.gsub!("a", "z"); rescue => e019; e019.class; end)
p(begin; s020 = "abc".freeze; s020.reverse!; rescue => e020; e020.class; end)
