# frozen_string_literal: true
# Text munging with scan (capture groups), gsub (block + backref), and split.
# Inference: String#scan returns Array(Array(String)) with groups, gsub with a
# block rebuilds a String, and the pieces must keep their String element types.

log = "GET /home 200, POST /login 302, GET /admin 403, DELETE /item 204"

entries = log.scan(/(\w+) (\S+) (\d+)/)
entries.each { |verb, path, code| puts "#{code} #{verb} #{path}" }

p entries.length
p entries.map { |_, _, code| code.to_i }.sum

shout = "hello world foo".gsub(/\w+/) { |w| w.capitalize }
p shout

masked = "id=42 key=secret pin=1234".gsub(/=(\w+)/) { "=#{'*' * $1.length}" }
p masked

words = "the,quick,brown,fox".split(",")
p words.map(&:length)
p words.max_by(&:length)
