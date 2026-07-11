# frozen_string_literal: true
# LocalJumpError.new
# Constructing via .new raises `uninitialized constant LocalJumpError (NameError)`
# under Spinel, even though the constant resolves everywhere else. The direct form
# (`p LocalJumpError.new(...)`) aborts the whole program at runtime, so each case is
# a single rescue-wrapped probe.
r001 = (LocalJumpError.new("boom").message rescue $!.class); p r001
r002 = (LocalJumpError.new.message rescue $!.class); p r002
r003 = (LocalJumpError.new(nil).message rescue $!.class); p r003
r004 = (LocalJumpError.new("m").to_s rescue $!.class); p r004
r005 = (LocalJumpError.new("m").inspect rescue $!.class); p r005
r006 = (LocalJumpError.new("m").class rescue $!.class); p r006

# The constant itself resolves fine (these all agree):
p LocalJumpError
p LocalJumpError.superclass
p LocalJumpError.ancestors.include?(StandardError)
k007 = LocalJumpError.superclass; p k007
