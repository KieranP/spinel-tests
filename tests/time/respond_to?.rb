# frozen_string_literal: true
# Time#respond_to?

p Time.utc(2020, 1, 1).respond_to?(:year)
p Time.utc(2020, 1, 1).respond_to?(:to_i)

a001 = Time.utc(2020, 1, 1)
p a001.respond_to?(:hour)

a002 = Time.utc(2020, 1, 1)
b002 = a002.respond_to?(:strftime)
p b002.class
p b002

# respond_to? for a method Time does not define wrongly returns true.
p Time.utc(2020, 1, 1).respond_to?(:no_such_method)
p Time.utc(2020, 1, 1).respond_to?(:succ)
c003 = Time.utc(2020, 1, 1)
d003 = c003.respond_to?(:no_such_method)
p d003
