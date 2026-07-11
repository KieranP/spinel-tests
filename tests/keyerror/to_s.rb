# frozen_string_literal: true
# KeyError#to_s
p(KeyError.new("boom").to_s)
s001 = KeyError.new("boom").to_s; p s001

# default to_s is the class name
p(KeyError.new.to_s)
s002 = KeyError.new.to_s; p s002

# explicit nil argument falls back to the class name
p(KeyError.new(nil).to_s)
s003 = KeyError.new(nil).to_s; p s003

# to_s of a rescued (natural) KeyError is a non-empty String
p(begin; {a: 1}.fetch(:zzz); rescue KeyError => e004; e004.to_s.class; end)
r005 = (begin; {a: 1}.fetch(:zzz); rescue KeyError => e005; e005.to_s.length > 0; end); p r005
