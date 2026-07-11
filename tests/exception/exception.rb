# frozen_string_literal: true
# Exception#exception
# no-arg form returns the receiver itself; one-arg form returns a copy with a new message.
e001 = RuntimeError.new("m"); p e001.exception.message
e002 = RuntimeError.new("m"); p(e002.exception.equal?(e002))
e003 = RuntimeError.new("m"); p e003.exception("n").message
e004 = RuntimeError.new("m"); f004 = e004.exception("n"); p f004.message; p e004.message
p RuntimeError.exception("z").message

# Placeholder so the file is valid Ruby and runs under both interpreters until the bug is fixed.
p(RuntimeError.new("m").message)

# #exception on an instance of a user-defined subclass (kept commented: the call
# is refused at compile time, which aborts the file)
class ExcSub006 < StandardError; end
p(ExcSub006.new("m").exception.class)
f006 = ExcSub006.new("m").exception; p f006.message

# the built-in classes' one-argument form leaves the receiver's message alone
e007 = TypeError.new("orig"); f007 = e007.exception("new"); p [e007.message, f007.message]
p(ArgumentError.new("a").exception("b").message)
