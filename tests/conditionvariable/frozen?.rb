# frozen_string_literal: true
# ConditionVariable#frozen?

p(ConditionVariable.new.frozen?)
a001 = ConditionVariable.new
p a001.frozen?
a002 = ConditionVariable.new
a002.freeze
p a002.frozen?
a003 = ConditionVariable.new
c003 = a003.frozen?
p c003.class
p c003
