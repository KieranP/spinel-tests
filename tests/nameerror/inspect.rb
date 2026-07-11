# frozen_string_literal: true
# NameError#inspect
p(NameError.new("boom", :x).inspect)
v001 = NameError.new("boom", :x); p v001.inspect
# inspect of a naturally-raised error is a non-empty String
begin; Object.const_get(:MissingConstB); rescue NameError => e002; p(e002.inspect.is_a?(String)); end
v003 = (begin; Object.const_get(:MissingConstB); rescue NameError => e003; e003.inspect.is_a?(String); end); p v003
