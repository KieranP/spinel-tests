# frozen_string_literal: true
# NoMethodError#to_s
p(NoMethodError.new("boom", :x).to_s)
v001 = NoMethodError.new("boom", :x); p v001.to_s
# to_s of a naturally-raised error is a non-empty String
begin; nil.foo; rescue NoMethodError => e002; p(e002.to_s.is_a?(String)); p(e002.to_s.empty?); end
v002 = (begin; nil.foo; rescue NoMethodError => e003; e003.to_s.is_a?(String); end); p v002
