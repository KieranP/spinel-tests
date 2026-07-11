# frozen_string_literal: true
# Kernel#!~
p(nil !~ /x/)
c020 = (nil !~ /x/); p c020
p("abc" !~ /z/)
p("abc" !~ /b/)
c021 = ("abc" !~ /z/); p c021
class Matcher020
  def =~(other); other == "hit"; end
end
p(Matcher020.new !~ "miss")
m020 = (Matcher020.new !~ "miss"); p m020
