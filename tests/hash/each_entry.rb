# frozen_string_literal: true
# Hash#each_entry
# A Hash literal receiver emits ill-typed C and the built program prints nothing at
# all, so these forms are kept commented — a live one would lose the whole file.
p({ a: 1, b: 2 }.each_entry { |e001| e001 })
a002 = { a: 1, b: 2 }; o002 = []; a002.each_entry { |e002| o002 << e002 }; p o002
a003 = { a: 1, b: 2 }; c003 = (a003.each_entry { |e003| e003 }); p c003
a004 = { "a" => 1 }; o004 = []; a004.each_entry { |e004| o004 << e004 }; p o004
a005 = {}; o005 = []; a005.each_entry { |e005| o005 << e005 }; p o005
p({}.each_entry { |e006| e006 })
