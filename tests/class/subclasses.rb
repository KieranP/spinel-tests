# frozen_string_literal: true
class Base001; end
class Kid1001 < Base001; end
class Kid2001 < Base001; end

# Class#subclasses
p(Base001.subclasses.map { |c| c.name }.sort)
v001 = Base001.subclasses; p v001.map { |c| c.name }.sort
p(Base001.subclasses.length)
b001 = Base001
p(b001.subclasses.length)
