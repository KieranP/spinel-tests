# frozen_string_literal: true
# FrozenError#inspect
p(FrozenError.new("boom").inspect)
i001 = FrozenError.new("boom").inspect; p i001

# no message: inspect shows the class name as the message
p(FrozenError.new.inspect)
i002 = FrozenError.new.inspect; p i002

# inspect of a rescued (natural) frozen error is a non-empty String
p(begin; "s".freeze << "x"; rescue FrozenError => e003; e003.inspect.class; end)
r004 = (begin; "s".freeze << "x"; rescue FrozenError => e004; e004.inspect.length > 0; end); p r004

# `p` on a FrozenError object uses inspect
p(FrozenError.new("via p"))
a005 = FrozenError.new("via p"); p a005
