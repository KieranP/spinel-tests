# frozen_string_literal: true
# LocalJumpError#reason
# yield with no block -> :noreason
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.reason; end
begin; m001; rescue LocalJumpError => e002; v002 = e002.reason; p v002; end

# break out of a called proc -> :break
begin; proc { break }.call; rescue LocalJumpError => e003; p e003.reason; end
begin; proc { break 5 }.call; rescue LocalJumpError => e004; v004 = e004.reason; p v004; end

# return out of a proc whose defining method already returned -> :return
def make005; proc { return }; end
pr005 = make005
begin; pr005.call; rescue LocalJumpError => e005; p e005.reason; end
def make006; proc { return 9 }; end
pr006 = make006
begin; pr006.call; rescue LocalJumpError => e006; v006 = e006.reason; p v006; end

# reason is a Symbol
begin; m001; rescue LocalJumpError => e007; p e007.reason.class; end

# `next` in a called proc does NOT raise (Ruby returns the value); Spinel rejects it
# at compile time, so this contrast line stays commented:
p proc { next 5 }.call

# a LocalJumpError raised from `yield` inside a nested block still reports :noreason
def m008; [1].each { yield }; end
begin; m008; rescue LocalJumpError => e008; p e008.reason; end
r008 = (begin; m008; rescue LocalJumpError => x008; x008.reason; end); p r008

# LocalJumpError is a StandardError
p(LocalJumpError.ancestors.include?(StandardError))
a009 = (LocalJumpError <= StandardError); p a009
