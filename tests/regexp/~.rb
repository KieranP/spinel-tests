# frozen_string_literal: true
# Regexp#~  (match the pattern against $_)
$_ = "hello"; p(~ /ell/)
$_ = "hello"; p(~ /zzz/)
$_ = "hello"; v001 = (~ /ell/); p v001
$_ = "hello"; v002 = (~ /zzz/); p v002

# ~ sets the match globals from $_
$_ = "hello world"; ~ /(o) (w)/; p $1; p $2; p $&
$_ = "hello"; a003 = (~ /l+/); b003 = $~[0]; p b003
