# frozen_string_literal: true
# LocalJumpError#==
def m001; yield; end
# reflexive on a natural instance
begin; m001; rescue LocalJumpError => e001; p(e001 == e001); end
begin; m001; rescue LocalJumpError => e002; c002 = (e002 == e002); p c002; end

# not equal to a non-exception
begin; m001; rescue LocalJumpError => e003; p(e003 == "x"); end
begin; m001; rescue LocalJumpError => e004; c004 = (e004 == nil); p c004; end

# constructed via .new -> raises NameError (rescue-wrapped probe)
r005 = (LocalJumpError.new("m") == LocalJumpError.new("m") rescue $!.class); p r005
