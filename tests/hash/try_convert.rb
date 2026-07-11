# frozen_string_literal: true
# Hash.try_convert
p(Hash.try_convert({ a: 1 }))
t001 = Hash.try_convert({ a: 1 }); p t001
p(Hash.try_convert("x"))
t002 = Hash.try_convert("x"); p t002
p(Hash.try_convert([[1, 2]]))
t003 = Hash.try_convert([[1, 2]]); p t003
