# frozen_string_literal: true
# Float#!~ (Kernel#!~ — negated =~; Float defines no #=~, so Ruby raises NoMethodError)
# Spinel miscompiles this into a regex match against the Float value
# (sp_re_match_p(pat, 3.5), passing a double where a const char* is expected),
# so the C compilation fails outright. Both forms aborted, so both commented:
r001 = (3.5 !~ /x/ rescue $!.class); p r001
a001 = 3.5; r002 = (a001 !~ /x/ rescue $!.class); p r002
