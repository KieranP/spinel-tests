# frozen_string_literal: true
# NoMethodError#inspect
p(NoMethodError.new("boom", :x).inspect)
v001 = NoMethodError.new("boom", :x); p v001.inspect
# inspect of a naturally-raised error is a non-empty String
begin; nil.foo; rescue NoMethodError => e002; p(e002.inspect.is_a?(String)); end
v002 = (begin; nil.foo; rescue NoMethodError => e003; e003.inspect.is_a?(String); end); p v002
