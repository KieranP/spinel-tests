# frozen_string_literal: true
# LocalJumpError#is_a? / #kind_of? (LocalJumpError < StandardError < Exception)
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.is_a?(LocalJumpError); end
begin; m001; rescue LocalJumpError => e002; p e002.is_a?(Exception); end
begin; m001; rescue LocalJumpError => e003; p e003.is_a?(Object); end
begin; m001; rescue LocalJumpError => e004; p e004.is_a?(ArgumentError); end
begin; m001; rescue LocalJumpError => e005; r005 = e005.is_a?(Exception); p r005; end

# is_a?/kind_of? StandardError -> Spinel answers false (Ruby: true)
begin; m001; rescue LocalJumpError => e006; p e006.is_a?(StandardError); end
begin; m001; rescue LocalJumpError => e007; p e007.kind_of?(StandardError); end
begin; m001; rescue LocalJumpError => e008; r008 = e008.is_a?(StandardError); p r008; end

# a break-raised instance also (BUG)
begin; proc { break }.call; rescue LocalJumpError => e009; p e009.is_a?(StandardError); end
