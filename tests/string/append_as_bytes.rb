# frozen_string_literal: true
# String#append_as_bytes
a01 = +"abc"; a01.append_as_bytes("de"); p a01
a02 = +"abc"; a02.append_as_bytes(100, 101); p a02
a03 = +"abc"; c03 = (a03.append_as_bytes("de")); p c03
# mixes string and integer byte arguments
a04 = +"x"; a04.append_as_bytes("y", 122); p a04
# a frozen receiver must raise
a05 = "abc"; r05 = (a05.append_as_bytes("de") rescue $!.class); p r05
