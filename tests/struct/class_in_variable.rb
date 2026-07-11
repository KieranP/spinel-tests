# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct class held in a variable
k144 = Struct.new(:a, :b); o144 = k144.new(1, 2); p(o144.a)
k144b = Struct.new(:a, :b); o144b = k144b.new(1, 2); v031 = o144b.a; p(v031)
