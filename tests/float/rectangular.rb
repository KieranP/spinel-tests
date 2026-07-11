# frozen_string_literal: true
# Float#rectangular (alias of #rect)
# Direct p() form aborts compilation ("unsupported p argument: CallNode `rectangular`"):
p(3.5.rectangular)
# Assignment form compiles but raises NoMethodError at runtime:
r001 = (3.5.rectangular rescue $!.class); p r001
a001 = -2.5; r002 = (a001.rectangular rescue $!.class); p r002
