# frozen_string_literal: true
# LocalJumpError#message
# A naturally-raised LocalJumpError carries a non-empty String message (agrees).
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.message.class; end
begin; m001; rescue LocalJumpError => e002; p e002.message.length > 0; end
begin; m001; rescue LocalJumpError => e003; v003 = e003.message; p v003.class; end

# message and to_s agree
begin; m001; rescue LocalJumpError => e004; p(e004.message == e004.to_s); end

# a break-raised instance also has a String message
begin; proc { break }.call; rescue LocalJumpError => e005; p e005.message.class; end

# constructed via .new -> raises NameError (rescue-wrapped probe)
r006 = (LocalJumpError.new("boom").message rescue $!.class); p r006
