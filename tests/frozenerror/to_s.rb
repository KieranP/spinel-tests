# frozen_string_literal: true
# FrozenError#to_s
p(FrozenError.new("boom").to_s)
s001 = FrozenError.new("boom").to_s; p s001

# default to_s is the class name
p(FrozenError.new.to_s)
s002 = FrozenError.new.to_s; p s002

# explicit nil argument falls back to the class name
p(FrozenError.new(nil).to_s)
s003 = FrozenError.new(nil).to_s; p s003

# to_s of a rescued (natural) frozen error is a non-empty String
p(begin; [1].freeze << 2; rescue FrozenError => e004; e004.to_s.class; end)
r005 = (begin; [1].freeze << 2; rescue FrozenError => e005; e005.to_s.length > 0; end); p r005
