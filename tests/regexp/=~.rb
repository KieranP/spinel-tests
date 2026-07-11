# frozen_string_literal: true
# Regexp#=~
p("hello" =~ /l+/)
a003 = "hello"; p(a003 =~ /l+/)
a004 = "hello"; b004 = /l+/; p(a004 =~ b004)
"hello" =~ /l/; p($~.class)
a005 = ("hello" =~ /l/); m005 = $~; p(m005.is_a?(MatchData))

# Regexp#=~ (Regexp receiver)
p(/l+/ =~ "hello")
p(/xyz/ =~ "hello")
a006 = /l+/; p(a006 =~ "hello")
a007 = /l+/; b007 = "hello"; p(a007 =~ b007)

# Match globals set as a side effect of =~
"hello world" =~ /(o)(r)/; p($&); p($1); p($2); p($`); p($')
a008 = ("hello world" =~ /(o)(r)/); v008 = $&; p v008

# A literal Regexp with named captures on the LHS of =~ assigns locals
/(?<greet>\w+) (?<who>\w+)/ =~ "hi there"; p(greet); p(who)

# =~ with no match returns nil
p("abc" =~ /z/)
a009 = "abc"; v009 = (a009 =~ /z/); p v009

# =~ position on a multibyte receiver (character offset)
p("héllo" =~ /llo/)
a010 = "héllo"; v010 = (a010 =~ /llo/); p v010

# A nil right-hand operand answers nil
r011 = (/a/ =~ nil rescue $!.class); p r011

# $~ and $1 are frame-local: a match inside a called method leaves the caller's alone
def m012(s012)
  s012 =~ /(l)/
  $1
end
p m012("hello")
"abc" =~ /(b)/
p m012("hello")
p $1

# =~ inside a block leaves the enclosing $1 as the block left it
"zz" =~ /(z)/
["ab", "cd"].each { |s013| s013 =~ /(\w)/ }
p $1

# $+ is the last group that matched
"abc" =~ /(a)(b)?(c)/; p $+
"abc" =~ /(a)(b)(c)/; p $+
"abc" =~ /a/; p $+
v014 = ("abc" =~ /(a)(b)/); w014 = $+; p w014

# After a failed match every global resets
"hello" =~ /zzz/
p $~; p $1; p $&
