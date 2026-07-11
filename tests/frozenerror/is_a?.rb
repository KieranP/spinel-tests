# frozen_string_literal: true
# FrozenError#is_a? / #kind_of? (FrozenError < RuntimeError < StandardError < Exception)
f001 = FrozenError.new("m")
p(f001.is_a?(FrozenError))
p(f001.is_a?(RuntimeError))
p(f001.is_a?(StandardError))
p(f001.is_a?(Exception))
p(f001.is_a?(ArgumentError))
r002 = f001.is_a?(RuntimeError); p r002

# kind_of? is the alias
p(f001.kind_of?(RuntimeError))
r003 = f001.kind_of?(StandardError); p r003

# a naturally-raised frozen error is a RuntimeError
p(begin; [1].freeze << 2; rescue => e004; e004.is_a?(RuntimeError); end)
r005 = (begin; [1].freeze << 2; rescue => e005; e005.is_a?(FrozenError); end); p r005
