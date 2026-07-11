# frozen_string_literal: true
# FrozenError.new
# String message
p(FrozenError.new("frozen!").message)
n001 = FrozenError.new("frozen!"); p n001.message

# no argument -> default (class name) message
p(FrozenError.new.message)
n002 = FrozenError.new; p n002.message

# explicit nil message defaults to the class name
p(FrozenError.new(nil).message)
n003 = FrozenError.new(nil).message; p n003

# receiver: keyword sets #receiver
p(FrozenError.new("m", receiver: "obj").receiver)
n004 = FrozenError.new("m", receiver: 42); p n004.receiver

# constructed instance is a FrozenError
p(FrozenError.new("m").class)
n005 = FrozenError.new("m"); p n005.class

# message and receiver together
n006 = FrozenError.new("cannot modify", receiver: [1, 2])
p n006.message
p n006.receiver

# raising a constructed instance preserves its message
p(begin; raise FrozenError.new("boom"); rescue => e007; e007.message; end)
r008 = (begin; raise FrozenError.new("boom"); rescue => e008; e008.message; end); p r008
