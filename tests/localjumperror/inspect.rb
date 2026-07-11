# frozen_string_literal: true
# LocalJumpError#inspect
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.inspect.class; end
begin; m001; rescue LocalJumpError => e002; p e002.inspect.include?("LocalJumpError"); end
begin; m001; rescue LocalJumpError => e003; v003 = e003.inspect; p v003.length > 0; end

# `p` on the object uses inspect
begin; proc { break }.call; rescue LocalJumpError => e004; p e004.inspect.class; end

# constructed via .new -> raises NameError (rescue-wrapped probe)
r005 = (LocalJumpError.new("boom").inspect rescue $!.class); p r005
