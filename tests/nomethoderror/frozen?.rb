# frozen_string_literal: true
# NoMethodError#frozen?
# frozen? on an exception instance aborts compilation under Spinel
p(NoMethodError.new("x").frozen?)
v001 = NoMethodError.new("x").frozen?; p v001
r001 = (NoMethodError.new("x").frozen? rescue $!.class); p r001
p(NoMethodError.new("x").class)
