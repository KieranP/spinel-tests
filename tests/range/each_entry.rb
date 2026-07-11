# frozen_string_literal: true
# Range#each_entry
r001 = []; (1..3).each_entry { |x001| r001 << x001 }; p r001
p((1..3).each_entry { |x002| x002 }.class)
a003 = (1..3); v003 = (a003.each_entry { |x003| x003 }); p v003
r004 = ((1..3).each_entry.to_a rescue $!.class); p r004
