# frozen_string_literal: true
# Exception#inspect
p(ArgumentError.new("boom").inspect)
i001 = ArgumentError.new("boom").inspect; p i001

# no message: inspect shows the class name as the message
p(RuntimeError.new.inspect)
i002 = RuntimeError.new.inspect; p i002

# inspect of a rescued exception
begin; raise TypeError, "t"; rescue => e003; p e003.inspect; end
i004 = (begin; raise TypeError, "t"; rescue => e004; e004.inspect; end); p i004

# `p` on an exception object uses inspect
p(RuntimeError.new("via p"))
a005 = RuntimeError.new("via p"); p a005

# a user-defined subclass
class SubIns006 < StandardError; end
p(SubIns006.new("m").inspect)
i006 = SubIns006.new("m").inspect; p i006
p(SubIns006.new("m"))

# an explicitly empty message: Ruby answers the bare class name
p(RuntimeError.new("").inspect)
i007 = RuntimeError.new("").inspect; p i007
