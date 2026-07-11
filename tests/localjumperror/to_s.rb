# frozen_string_literal: true
# LocalJumpError#to_s
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.to_s.class; end
begin; m001; rescue LocalJumpError => e002; p e002.to_s.length > 0; end
begin; m001; rescue LocalJumpError => e003; v003 = e003.to_s; p v003.class; end

# to_s and message agree on a natural instance
begin; m001; rescue LocalJumpError => e004; p(e004.to_s == e004.message); end

# constructed via .new -> raises NameError (rescue-wrapped probe)
r005 = (LocalJumpError.new("m").to_s rescue $!.class); p r005
