# frozen_string_literal: true
# Symbol#to_s
p(:hello.to_s)
a027 = :hello; p(a027.to_s)
a028 = :hello; c028 = (a028.to_s); p c028
# operator symbol, special-char symbol, and multibyte to_s (no quotes, raw name)
p(:+.to_s)
v001 = (:+.to_s); p v001
p(:[].to_s)
v002 = (:[].to_s); p v002
p(:"a b".to_s)
v003 = (:"a b".to_s); p v003
p(:"1x".to_s)
v004 = (:"1x".to_s); p v004
p(:café.to_s)
v005 = (:café.to_s); p v005
a029 = :"a b"; c029 = (a029.to_s); p c029
