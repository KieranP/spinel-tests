# frozen_string_literal: true
# NilClass#instance_of?
p(nil.instance_of?(NilClass))
p(nil.instance_of?(String))
a018 = nil; p(a018.instance_of?(NilClass))
a019 = nil; v019 = a019.instance_of?(String); p v019
# instance_of? is exact class, not ancestor
p(nil.instance_of?(Object))
# a Module argument is simply not nil's exact class -> false
r020 = (nil.instance_of?(Comparable) rescue $!.class); p r020
# receiver and class-argument both in variables
a021 = nil; k021 = NilClass; p(a021.instance_of?(k021))
a022 = nil; k022 = Integer; v022 = a022.instance_of?(k022); p v022
