# frozen_string_literal: true
# NoMethodError#message
# explicit construction keeps the given message
p(NoMethodError.new("hi there", :x).message)
v001 = NoMethodError.new("hi there", :x); p v001.message
# a naturally-raised NoMethodError carries a non-empty String message
begin; nil.foo(1, 2); rescue NoMethodError => e002; p(e002.message.is_a?(String)); end
begin; nil.foo(1, 2); rescue NoMethodError => e003; p(e003.message.empty?); end
v002 = (begin; nil.foo(1, 2); rescue NoMethodError => e004; e004.message.is_a?(String); end); p v002
