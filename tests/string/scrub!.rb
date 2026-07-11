# frozen_string_literal: true
# String#scrub!
# a valid string needs no replacement, so CRuby does not raise even when frozen
r001 = ("hello".scrub! rescue $!.class); p r001
a001 = +"abc\x80def"; r002 = (a001.scrub!("?") rescue $!.class); p r002
a002 = +"abc\x80def"; b002 = "?"; r003 = (a002.scrub!(b002) rescue $!.class); p r003
a004 = +"hello"; r005 = (a004.scrub! rescue $!.class); p r005
# a frozen receiver WITH something to replace must raise
a003 = "abc\x80def"; r004 = (a003.scrub!("?") rescue $!.class); p r004
# direct form on a frozen valid string (kept last: it raises at runtime and would suppress the rest)
p("hello".scrub!)
