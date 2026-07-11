# frozen_string_literal: true
# Kernel#clone
class Foo301; attr_accessor :x; end
a301 = Foo301.new; a301.x = 5
p(a301.clone.x)
b301 = a301.clone; p(b301.x)
p(Foo301.new.clone.equal?(Foo301.new))
a303 = Foo301.new; v303 = a303.clone; p(v303.equal?(a303))
a304 = Foo301.new; a304.freeze; p(a304.clone.frozen?)
a305 = Foo301.new; a305.freeze; v305 = a305.clone; p(v305.frozen?)
a306 = Foo301.new; p(a306.clone(freeze: false).frozen?)
a307 = Foo301.new; v307 = a307.clone(freeze: true); p(v307.frozen?)
p([1, 2].freeze.clone.frozen?)
p([1, 2].freeze.clone(freeze: false).frozen?)
p("ab".freeze.clone.frozen?)
p(1.clone)
p(nil.clone)
v308 = { a: 1 }.freeze.clone; p(v308.frozen?)
p({ a: 1 }.freeze.clone.frozen?)
r310 = ({ a: 1 }.freeze.clone[:b] = 2) rescue $!.class; p r310
v309 = [1, 2].clone; p v309
