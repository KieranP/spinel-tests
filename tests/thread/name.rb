# frozen_string_literal: true
# Thread#name
t001 = Thread.new { 1 }
t001.join
p t001.name
t002 = Thread.new { 1 }
t002.name = "worker"
t002.join
n001 = t002.name
p n001

# Thread.name — the class constant itself, used as a value.
zt10 = (Thread.name rescue $!.class); p zt10
