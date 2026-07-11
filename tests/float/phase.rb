# frozen_string_literal: true
# Float#phase
p((-1.5).phase)
a001 = -1.5; p(a001.phase)
r001 = ((-1.5).phase rescue $!.class); p r001
r002 = (1.5.phase rescue $!.class); p r002
a002 = -1.5; r003 = (a002.phase rescue $!.class); p r003
