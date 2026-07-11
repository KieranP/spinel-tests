# frozen_string_literal: true
# Thread#name=
t001 = Thread.new { 1 }
p(t001.name = "w")
t001.join
t002 = Thread.new { 1 }
n001 = (t002.name = "x")
t002.join
p n001
