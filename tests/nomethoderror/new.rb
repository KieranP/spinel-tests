# frozen_string_literal: true
# NoMethodError.new
# message-only form
p(NoMethodError.new("boom").message)
p(NoMethodError.new("boom").name)
v001 = NoMethodError.new("boom"); p v001.message; p v001.name
# message + name form
p(NoMethodError.new("boom", :meth).message)
p(NoMethodError.new("boom", :meth).name)
v002 = NoMethodError.new("boom", :meth); p v002.message; p v002.name
# no-arg form
p(NoMethodError.new.message)
p(NoMethodError.new.name)
v003 = NoMethodError.new; p v003.message; p v003.name
# full positional form (message, name, args, private)
p(NoMethodError.new("m", :nm, [1, 2], true).message)
p(NoMethodError.new("m", :nm, [1, 2], true).name)
p(NoMethodError.new("m", :nm, [1, 2], true).args)
p(NoMethodError.new("m", :nm, [1, 2], true).private_call?)
v004 = NoMethodError.new("m", :nm, [1, 2], true); p v004.args
