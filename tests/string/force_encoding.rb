# frozen_string_literal: true
# String#force_encoding
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# p((+"hello").force_encoding("ASCII-8BIT").encoding.to_s)
# a01 = +"hello"; a01.force_encoding("ASCII-8BIT"); p a01.encoding.to_s
# a02 = +"hello"; b02 = "ASCII-8BIT"; a02.force_encoding(b02); p a02.encoding.to_s
a03 = +"hello"; c03 = (a03.force_encoding("UTF-8")); p c03.encoding.to_s
# force_encoding reinterprets bytes without changing them
p((+"hello").force_encoding("ASCII-8BIT").bytes)
# force_encoding returns the receiver
a04 = +"hello"; p(a04.force_encoding("UTF-8").equal?(a04))
# a frozen receiver must raise, even for the identity encoding
a05 = "hello"; r05 = (a05.force_encoding("UTF-8") rescue $!.class); p r05
