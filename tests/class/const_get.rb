# frozen_string_literal: true
class Box001; X001 = 1; end
module Cfg001; MAX001 = 10; end

# Class#const_get
p(Box001.const_get(:X001))
v001 = Box001.const_get(:X001); p v001
p(Cfg001.const_get(:MAX001))
v002 = Cfg001.const_get(:MAX001); p v002
c001 = Box001
p(c001.const_get(:X001))
v003 = c001.const_get(:X001); p v003
# const_get of a builtin constant raises NameError (direct :: access works)
r001 = (Float.const_get(:INFINITY) rescue $!.class); p r001
r002 = (Math.const_get(:PI) rescue $!.class); p r002

# const_get reaches a constant defined on a superclass or an included module
module Cfg002; MAX002 = 10; end
class Up002; TAG002 = "up"; end
class Down002 < Up002; include Cfg002; end
p(Down002.const_get(:TAG002))
v004 = Down002.const_get(:TAG002); p v004
p(Down002.const_get(:MAX002))
v005 = Down002.const_get(:MAX002); p v005
# with inherit false, only the receiver's own constants count
r003 = (Down002.const_get(:TAG002, false) rescue $!.class); p r003
# a name that is nowhere raises NameError
r004 = (Down002.const_get(:Nope002) rescue $!.class); p r004
