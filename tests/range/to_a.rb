# frozen_string_literal: true
# Range#to_a
p((1..5).to_a)
a055 = (1..5); p(a055.to_a)
a056 = (1..5); c056 = (a056.to_a); p c056
p((1...5).to_a)
a057 = (1...5); c057 = (a057.to_a); p c057
p((5..1).to_a)
r058 = ((1..).to_a rescue "RangeError"); p r058
r059 = ((1.0..5.0).to_a rescue "TypeError"); p r059
rr618 = [(1..3)]; r618 = (rr618[0].to_a rescue $!.class); p r618

p((3..3).to_a)
p((3...3).to_a)
p(("a".."e").to_a)
p(("a"..."e").to_a)
p(("ay".."bd").to_a)
p(("z".."a").to_a)
a060 = ("a".."e"); c060 = (a060.to_a); p c060
r061 = ((..5).to_a rescue $!.class); p r061
