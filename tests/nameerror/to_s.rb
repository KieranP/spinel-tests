# frozen_string_literal: true
# NameError#to_s
p(NameError.new("boom", :x).to_s)
v001 = NameError.new("boom", :x); p v001.to_s
# to_s of a naturally-raised error is a non-empty String
begin; Object.const_get(:MissingConstC); rescue NameError => e002; p(e002.to_s.is_a?(String)); p(e002.to_s.empty?); end
v003 = (begin; Object.const_get(:MissingConstC); rescue NameError => e003; e003.to_s.is_a?(String); end); p v003
