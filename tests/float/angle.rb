# frozen_string_literal: true
# Float#angle
p((-1.5).angle)
a001 = -1.5; p(a001.angle)
r001 = ((-1.5).angle rescue $!.class); p r001
r002 = (1.5.angle rescue $!.class); p r002
a002 = -1.5; r003 = (a002.angle rescue $!.class); p r003
