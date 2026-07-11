# frozen_string_literal: true
# Thread#[]=
t001 = Thread.new { Thread.current[:k] = 7; Thread.current[:k] }
p t001.value
t002 = Thread.new { (Thread.current[:n] = 4) }
v001 = t002.value
p v001
