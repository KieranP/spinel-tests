# frozen_string_literal: true
# TrueClass#!~ / FalseClass#!~
# `bool !~ /re/` invokes Kernel#!~; there is no Object#=~ in Ruby, so it raises
# NoMethodError. Both Ruby and Spinel now raise it, and the rescue-wrapped probes match
# (a rescue-wrapped error probe is already the assignment form, so it stays single).
r001 = (true !~ /x/ rescue $!.class); p r001
r002 = (false !~ /x/ rescue $!.class); p r002
