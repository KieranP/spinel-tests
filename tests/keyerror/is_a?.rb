# frozen_string_literal: true
# KeyError#is_a? / #kind_of? (KeyError < IndexError < StandardError < Exception)
k001 = KeyError.new("m")
p(k001.is_a?(KeyError))
p(k001.is_a?(IndexError))
p(k001.is_a?(StandardError))
p(k001.is_a?(Exception))
p(k001.is_a?(ArgumentError))
r002 = k001.is_a?(IndexError); p r002

# kind_of? is the alias
p(k001.kind_of?(IndexError))
r003 = k001.kind_of?(StandardError); p r003

# a naturally-raised KeyError is an IndexError and a StandardError
p(begin; {a: 1}.fetch(:z); rescue => e004; e004.is_a?(IndexError); end)
r005 = (begin; {a: 1}.fetch(:z); rescue => e005; e005.is_a?(KeyError); end); p r005
p(begin; {a: 1}.fetch(:z); rescue => e006; e006.is_a?(StandardError); end)
