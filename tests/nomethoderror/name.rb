# frozen_string_literal: true
# NoMethodError#name
# explicit constructor records the name
p(NoMethodError.new("m", :foo).name)
n001 = NoMethodError.new("m", :foo).name; p n001
# a naturally-raised NoMethodError records the missing method name
begin; nil.foo(1); rescue NoMethodError => e002; p e002.name; end
n002 = (begin; nil.foo(1); rescue NoMethodError => e003; e003.name; end); p n002
begin; "s".no_such(9); rescue NoMethodError => e004; p e004.name; end
n003 = (begin; Object.new.bar(3); rescue NoMethodError => e005; e005.name; end); p n003
