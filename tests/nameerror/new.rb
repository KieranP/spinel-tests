# frozen_string_literal: true
# NameError.new
# two-arg form (message, name)
p(NameError.new("boom", :sym1).message)
p(NameError.new("boom", :sym1).name)
v001 = NameError.new("boom", :sym1); p v001.message; p v001.name
# no-arg form
p(NameError.new.message)
p(NameError.new.name)
v002 = NameError.new; p v002.message; p v002.name
# message-only form
p(NameError.new("only msg").message)
p(NameError.new("only msg").name)
v003 = NameError.new("only msg"); p v003.message; p v003.name
