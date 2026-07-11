# frozen_string_literal: true
# Regexp.last_match
p(Regexp.last_match)
"hi" =~ /h/; v001 = Regexp.last_match; p v001

# Regexp.last_match(n) picks a group; out of range is nil
"2024-01-15" =~ /(?<y>\d+)-(?<mo>\d+)-(?<d>\d+)/
p(Regexp.last_match(0))
p(Regexp.last_match(2))
p(Regexp.last_match(9))
v002 = Regexp.last_match(3); p v002

# Regexp.last_match(:name) picks the named group
p(Regexp.last_match(:y))
v003 = Regexp.last_match(:mo); p v003

# After a failed match, last_match is nil
"abc" =~ /zzz/
p(Regexp.last_match)
v004 = Regexp.last_match; p v004

# match? leaves last_match alone
"abc".match?(/b/)
p(Regexp.last_match)

# A String name aborts the C build. Kept commented: a compile abort takes down the file.
"2024-01" =~ /(?<yy>\d+)-(?<mm>\d+)/; p(Regexp.last_match("mm"))
"2024-01" =~ /(?<yy>\d+)-(?<mm>\d+)/; v005 = Regexp.last_match("yy"); p v005
