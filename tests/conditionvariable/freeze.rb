# frozen_string_literal: true
# ConditionVariable#freeze

p(ConditionVariable.new.freeze.class)
a001 = ConditionVariable.new
a001.freeze
p a001.class
a002 = ConditionVariable.new
c002 = a002.freeze
p c002.class
p c002.frozen?
