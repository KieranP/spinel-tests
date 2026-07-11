# frozen_string_literal: true
# Built-in Exception subclass constants (reflectability)
# The common Exception classes are fully reflectable:
p(RangeError.superclass)
p(IOError.superclass)
p(NotImplementedError.superclass)
p(ScriptError.superclass)
s001 = StandardError.superclass; p s001

# The rarer Exception subclasses reachable by a plain constant name are reflectable too:
p(SyntaxError.superclass)
p(RegexpError.superclass)
p(Interrupt.superclass)
p(SignalException.superclass)
p(UncaughtThrowError.superclass)
p(NoMatchingPatternError.superclass)
# A ::-scoped built-in class constant used as a value aborts compilation:
p(Math::DomainError.superclass)

# ...but they DO work as rescue targets:
begin; Regexp.new("["); rescue RegexpError => e002; p e002.class; end
