# frozen_string_literal: true
# String#match?
p("abc".match?(/b/))
a081 = "abc"; p(a081.match?(/b/))
a082 = "abc"; b082 = /b/; p(a082.match?(b082))
a083 = "abc"; b083 = /b/; c083 = (a083.match?(b083)); p c083
# a non-match returns false
p("abc".match?(/z/))
a084 = "abc"; v084 = (a084.match?(/z/)); p v084
# match? with a start position
p("hello".match?(/l/, 3))
p("hello".match?(/h/, 1))
a085 = "hello"; v085 = (a085.match?(/l/, 3)); p v085
# match? does not set $~
"abc".match?(/b/); p($~)
# a String argument is converted to a Regexp in Ruby
p("abc".match?("b"))
a086 = "abc"; v086 = (a086.match?("b")); p v086

# a String returned from a method with a `raise` branch
def raisebr_mq(omq)
  case omq
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
p raisebr_mq("ab").match?(/\w/)
rb_mq = raisebr_mq("ab").match?(/\w/); p rb_mq
