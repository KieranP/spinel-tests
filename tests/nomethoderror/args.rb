# frozen_string_literal: true
# NoMethodError#args
# a naturally-raised NoMethodError records the call arguments
begin; nil.foo(1, 2); rescue NoMethodError => e001; p e001.args; end
a001 = (begin; nil.foo(1, 2); rescue NoMethodError => e002; e002.args; end); p a001
# no arguments -> empty array
begin; "s".no_such; rescue NoMethodError => e003; p e003.args; end
a002 = (begin; Object.new.bar(7, 8, 9); rescue NoMethodError => e004; e004.args; end); p a002
# the explicit constructor's 3rd positional argument is the args array
p(NoMethodError.new("m", :nm, [1, 2]).args)
a003 = NoMethodError.new("m", :nm, [1, 2]).args; p a003
