# frozen_string_literal: true
# Time#strftime

t001 = Time.utc(2026, 7, 16, 13, 45, 30)
p t001.strftime("%Y-%m-%d")
p t001.strftime("%H:%M:%S")
p t001.strftime("%A, %B %d, %Y")
p t001.strftime("%a %b %e")
p t001.strftime("%I:%M %p")
p t001.strftime("%j")
p t001.strftime("%u %w")
p t001.strftime("%U %W %V %G")
p t001.strftime("%C %y")
p t001.strftime("%D %F %T %R %r")
p t001.strftime("%c")
p t001.strftime("%Z")
p t001.strftime("%%")
p t001.strftime("%-d %_d %0d")
p t001.strftime("%h %k %l")
p t001.strftime("[%n][%t]")

# Padding-flag modifiers on a single-digit field (day 4, month 3, hour 1, min 5, sec 6).
s004 = Time.utc(2020, 3, 4, 1, 5, 6)
p s004.strftime("%-d")
p s004.strftime("%_d")
p s004.strftime("%-m/%-d %-H:%-M:%-S")
p s004.strftime("%-I %-j")
r004 = s004.strftime("%_m %-m %0m")
p r004

fmt002 = "%Y/%m/%d %H:%M"
r002 = t001.strftime(fmt002)
p r002.class
p r002

t003 = Time.utc(2026, 7, 16, 13, 45, 30)
r003 = t003.strftime("%A")
p r003

# --- divergent directives, tagged ---
p t001.strftime("%z")
p t001.strftime("%s")
p t001.strftime("%P")
p t001.strftime("%L")
p t001.strftime("%N")
p t001.strftime("%6N")
p t001.strftime("%^A")
p t001.strftime("%3S")
p t001.strftime("%+")
p t001.strftime("%10Y")
p t001.strftime("%:z")
p t001.strftime("%::z")
p t001.strftime("%:::z")

# The E / O modifiers are ignored by Ruby, which formats the unmodified directive.
p t001.strftime("%Ey %EY %Ec %EX %Ex")
p t001.strftime("%Od %Om %OH")
v005 = t001.strftime("%Ey"); p v005

# A width on %L asks for that many fractional-second digits, exactly like %N.
s006 = Time.utc(2020, 1, 2, 3, 4, 5, 123456)
p s006.strftime("%L")
p s006.strftime("%3L")
p s006.strftime("%1L")
p s006.strftime("%6L")
p s006.strftime("%9L")
v006 = s006.strftime("%6L"); p v006
p s006.strftime("%1N %2N %3N %6N %9N %12N")
v007 = s006.strftime("%9N"); p v007

# A format ending in a bare % is invalid.
r008 = (t001.strftime("%") rescue $!.class); p r008
r009 = (t001.strftime("%Y%") rescue $!.class); p r009

# A fixed-offset receiver: every zone directive, and a whole ISO-8601 format.
s010 = Time.utc(2020, 1, 2, 3, 4, 5).getlocal("+05:30")
p s010.strftime("%z %:z %::z %:::z %Z")
p s010.strftime("%Y-%m-%dT%H:%M:%S%z")
v010 = s010.strftime("%Y-%m-%dT%H:%M:%S%:z"); p v010
p Time.utc(2020, 1, 2, 3, 4, 5).getlocal("-08:00").strftime("%z %:z %H %d")

# A pre-epoch receiver.
s011 = Time.utc(1960, 5, 4, 3, 2, 1)
p s011.strftime("%Y-%m-%d %H:%M:%S %j %s %A %B %p %I")
v011 = s011.strftime("%s"); p v011

# Week-numbering directives around a year boundary.
p Time.utc(2021, 1, 1).strftime("%U %W %V %G %g %u %w %j")
p Time.utc(2015, 12, 31).strftime("%U %W %V %G")
v012 = Time.utc(2016, 1, 3).strftime("%U %W %V %G"); p v012

# Case / width flags on the name directives.
p s006.strftime("%^a %^A %^b %^B %#a %#p %^p")
v013 = s006.strftime("%^B"); p v013
p s006.strftime("%5d %05d %-5d %_5d")
p s006.strftime("%-e|%0e|%_e|%-k|%0k")
p s006.strftime("%-l|%0l|%l")
v015 = s006.strftime("%0e"); p v015
v014 = s006.strftime("%-m/%-d/%-y"); p v014
