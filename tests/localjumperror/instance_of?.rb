# frozen_string_literal: true
# LocalJumpError#instance_of?
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.instance_of?(LocalJumpError); end
begin; m001; rescue LocalJumpError => e002; r002 = e002.instance_of?(LocalJumpError); p r002; end

# instance_of? is exact class only, not ancestors.
# StandardError happens to agree (both false) — Spinel does not link LocalJumpError
# to StandardError at all (see is_a? bug 20260719094343318).
begin; m001; rescue LocalJumpError => e003; p e003.instance_of?(StandardError); end
# Exception: Spinel wrongly reports true (instance_of? behaves like is_a? for exceptions).
begin; m001; rescue LocalJumpError => e004; p e004.instance_of?(Exception); end
begin; m001; rescue LocalJumpError => e006; r006 = e006.instance_of?(Exception); p r006; end

# a break-raised instance is exactly a LocalJumpError
begin; proc { break }.call; rescue LocalJumpError => e005; p e005.instance_of?(LocalJumpError); end
