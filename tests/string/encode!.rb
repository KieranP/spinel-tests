# frozen_string_literal: true
# String#encode!
# a mutable receiver: encode! to UTF-8 is a no-op that returns the receiver
a001 = +"hello"; r001 = (a001.encode!("UTF-8") rescue $!.class); p r001
a002 = +"hello"; b002 = "UTF-8"; r002 = (a002.encode!(b002) rescue $!.class); p r002
a003 = +"hello"; p(a003.encode!("UTF-8").equal?(a003))
# a frozen receiver must raise, even though the call would change nothing
r003 = ("hello".encode!("UTF-8") rescue $!.class); p r003
a004 = "hello"; r004 = (a004.encode!("UTF-8") rescue $!.class); p r004
