# frozen_string_literal: true
# Range#last
p((1..5).last)
a001 = (1..5); p(a001.last)
a002 = (1..5); c002 = (a002.last); p c002
p((1..5).last(2))
a003 = (1..5); p(a003.last(2))
a004 = (1..5); b004 = 2; p(a004.last(b004))
a005 = (1..5); b005 = 2; c005 = (a005.last(b005)); p c005
p((1...5).last(2))
p((1..5).last(0))

p((..5).last)
v006 = ((..5).last); p(v006)
p((5..1).last(2))
p((3..3).last(1))
p((1.0..5.0).last)
r007 = ((..5).last(2) rescue $!.class); p r007
r008 = ((1..).last rescue $!.class); p r008
r009 = ((1..5).last(-1) rescue $!.class); p r009
r010 = ((1..).last(2) rescue $!.class); p r010

# a -Float::INFINITY beginning no longer coerces the Integer end
p((-Float::INFINITY..5).last)
v101 = ((-Float::INFINITY..5).last); p v101
# a finite Float end paired with an Integer beginning is truncated
p((1..5.5).last)
v102 = ((1..5.5).last); p v102
