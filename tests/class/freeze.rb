# frozen_string_literal: true
class C001; end
C001.freeze

# Module#freeze (returns the receiver, works) / frozen? (unsupported)
p(C001.freeze.name)
v001 = C001.freeze; p v001.name
# frozen? on a class/module receiver compiles, but reports false for a frozen class.
p(C001.frozen?)
v002 = C001.frozen?; p v002
p(String.frozen?)
