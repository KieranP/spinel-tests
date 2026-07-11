# frozen_string_literal: true
# ConditionVariable#class
p(ConditionVariable.new.class)

a001 = ConditionVariable.new
p a001.class

a002 = ConditionVariable.new
a002.signal
p a002.class

a003 = ConditionVariable.new
c003 = a003.class
p c003.class
p c003
p c003.name

# the class constant itself, as a value
r004 = (ConditionVariable rescue $!.class)
p r004
r005 = (ConditionVariable.name rescue $!.class)
p r005
