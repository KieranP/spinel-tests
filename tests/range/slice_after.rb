# frozen_string_literal: true
# Range#slice_after
r001 = ((1..5).slice_after { |x001| x001 == 3 }.to_a rescue $!.class); p r001
a002 = (1..5); r002 = (a002.slice_after { |x002| x002 == 3 }.to_a rescue $!.class); p r002
p((1..5).to_a.slice_after { |x003| x003 == 3 }.to_a)
v004 = ((1..5).to_a.slice_after { |x004| x004 == 3 }.to_a); p v004
