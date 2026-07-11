# frozen_string_literal: true
# Float#arg
p((-1.5).arg)
a001 = -1.5; p(a001.arg)
r001 = ((-1.5).arg rescue $!.class); p r001
r002 = (1.5.arg rescue $!.class); p r002
a002 = -1.5; r003 = (a002.arg rescue $!.class); p r003
