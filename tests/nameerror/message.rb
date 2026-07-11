# frozen_string_literal: true
# NameError#message
# explicit construction keeps the given message
p(NameError.new("hi there", :x).message)
v001 = NameError.new("hi there", :x); p v001.message
# a naturally-raised NameError carries a non-empty String message
begin; Object.const_get(:MissingConstA); rescue NameError => e002; p(e002.message.is_a?(String)); end
begin; Object.const_get(:MissingConstA); rescue NameError => e003; p(e003.message.empty?); end
v004 = (begin; Object.const_get(:MissingConstA); rescue NameError => e004; e004.message.is_a?(String); end); p v004
