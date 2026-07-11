# frozen_string_literal: true
# NilClass#=~
# nil =~ /re/ returns nil in Ruby; nil !~ /re/ returns true, for any receiver.
p(nil =~ /x/)
v001 = (nil =~ /x/); p v001
p(nil !~ /x/)
v002 = (nil !~ /x/); p v002
n002 = nil; p(n002 !~ /x/)
n001 = nil; p(n001 =~ /x/)
