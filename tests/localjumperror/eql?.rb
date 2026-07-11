# frozen_string_literal: true
# LocalJumpError#eql? (Object#eql? — identity for exception instances)
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.eql?(e001); end
begin; m001; rescue LocalJumpError => e002; r002 = e002.eql?(e002); p r002; end

# not eql? to a non-exception
begin; m001; rescue LocalJumpError => e003; p e003.eql?("m"); end
