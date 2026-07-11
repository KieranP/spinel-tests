# frozen_string_literal: true
# Exception#detailed_message
p(RuntimeError.new("m").detailed_message)
d001 = RuntimeError.new("m").detailed_message; p d001

# subclass with a message
p(ArgumentError.new("bad").detailed_message)
d002 = ArgumentError.new("bad").detailed_message; p d002

# no message: falls back to the class name, tagged with the class
p(RuntimeError.new.detailed_message)
d003 = RuntimeError.new.detailed_message; p d003

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# begin; raise TypeError, "t"; rescue => e004; p e004.detailed_message; end
# d005 = (begin; raise TypeError, "t"; rescue => e005; e005.detailed_message; end); p d005

# #detailed_message on an instance of a user-defined subclass (kept commented:
# the call is refused at compile time, which aborts the file)
class DmSub006 < StandardError; end
p(DmSub006.new("m").detailed_message)
d006 = DmSub006.new("m").detailed_message; p d006.class

# the highlight: keyword is accepted on a built-in class
p(ArgumentError.new("bad").detailed_message(highlight: false))
d007 = RuntimeError.new("m").detailed_message(highlight: false); p d007
