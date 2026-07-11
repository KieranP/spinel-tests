# frozen_string_literal: true
# LocalJumpError#hash (Object#hash)
def m001; yield; end
# hash is an Integer
begin; m001; rescue LocalJumpError => e001; p e001.hash.is_a?(Integer); end
begin; m001; rescue LocalJumpError => e002; r002 = e002.hash.is_a?(Integer); p r002; end

# hash is stable for the same object
begin; m001; rescue LocalJumpError => e003; p(e003.hash == e003.hash); end
