# frozen_string_literal: true
# Signal.list

# Signal.list returns a fresh Hash mapping signal name (String, no "SIG" prefix) to
# number (Integer). Assert only platform-stable facts: INT/TERM/KILL/HUP/EXIT numbers
# and the presence of well-known names — never dump the whole hash (it varies by OS).
p(Signal.list.class)
p(Signal.list["INT"])
p(Signal.list["TERM"])
p(Signal.list["KILL"])
p(Signal.list["EXIT"])
p(Signal.list.key?("USR1"))
p(Signal.list.key?("NOPE"))
p(Signal.list.fetch("HUP"))
p(Signal.list.key(0))
p(Signal.list.values.include?(9))
p(Signal.list.size > 0)
p(Signal.list["HUP"])
p(Signal.list.frozen?)
p(Signal.list.fetch("NOPE", :none))
p(Signal.list.fetch("NOPE") { -1 })
p(Signal.list.key(9))
p(Signal.list.key(15))
h001 = Signal.list; p(h001.class)
h002 = Signal.list; p(h002["INT"])
h003 = Signal.list; p(h003.key?("TERM"))
h004 = Signal.list; p(h004["HUP"])
h005 = Signal.list; p(h005.values.include?(2))
