# frozen_string_literal: true
# KeyError#inspect
p(KeyError.new("boom").inspect)
i001 = KeyError.new("boom").inspect; p i001

# no message: inspect shows the class name as the message
p(KeyError.new.inspect)
i002 = KeyError.new.inspect; p i002

# inspect of a rescued (natural) KeyError is a non-empty String
p(begin; {a: 1}.fetch(:zzz); rescue KeyError => e003; e003.inspect.class; end)
r004 = (begin; {a: 1}.fetch(:zzz); rescue KeyError => e004; e004.inspect.length > 0; end); p r004

# `p` on a KeyError object uses inspect
p(KeyError.new("via p"))
a005 = KeyError.new("via p"); p a005
