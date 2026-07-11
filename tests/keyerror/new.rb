# frozen_string_literal: true
# KeyError.new
# String message
p(KeyError.new("boom").message)
n001 = KeyError.new("boom"); p n001.message

# no argument -> default (class name) message
p(KeyError.new.message)
n002 = KeyError.new; p n002.message

# explicit nil message defaults to the class name
p(KeyError.new(nil).message)
n003 = KeyError.new(nil).message; p n003

# key: keyword sets #key
p(KeyError.new("m", key: :k).key)
n004 = KeyError.new("m", key: :k); p n004.key

# receiver: keyword sets #receiver
p(KeyError.new("m", receiver: [1, 2]).receiver)
n005 = KeyError.new("m", receiver: [1, 2]); p n005.receiver

# message, key and receiver together
n006 = KeyError.new("cannot find", key: :missing, receiver: {a: 1})
p n006.message
p n006.key
p n006.receiver

# constructed instance is a KeyError
p(KeyError.new("m").class)
n007 = KeyError.new("m"); p n007.class

# raising a constructed instance preserves its message
p(begin; raise KeyError.new("boom"); rescue => e008; e008.message; end)
r008 = (begin; raise KeyError.new("boom"); rescue => e009; e009.message; end); p r008

# raising the class alone uses the default (class name) message
p(begin; raise KeyError; rescue => e010; e010.message; end)
