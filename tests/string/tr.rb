# frozen_string_literal: true
# String#tr
p("hello".tr("el", "ip"))
a139 = "hello"; p(a139.tr("el", "ip"))
a140 = "hello"; b140 = "el"; p(a140.tr(b140, "ip"))
a141 = "hello"; b141 = "el"; c141 = (a141.tr(b141, "ip")); p c141
# translates by character, including multibyte from/to sets
p("café".tr("é", "e"))
p("a☕b".tr("☕", "X"))
p("héllo".tr("l", "L"))
a142 = "café"; c142 = (a142.tr("é", "e")); p c142
# ranges, negation, and a shorter replacement (last char repeats)
p("hello".tr("a-y", "b-z"))
p("hello".tr("^aeiou", "*"))
p("hello".tr("el", "j"))

# A String returned from a method with a `raise` branch loses much of String's
# method table. Rescue-wrapped so it cannot truncate the rest of the file.
def raisebr_tr(otr)
  case otr
  when Integer then "i"
  when String  then "sample text"
  else raise ArgumentError, "no"
  end
end
rb_tr = (raisebr_tr("ab").tr("s", "x") rescue $!.class); p rb_tr

# #tr on a String returned by Fiber#resume.
f80tr = Fiber.new { Fiber.yield("t=1.5"); nil }
w80tr = f80tr.resume
r80tr = (w80tr.tr("t", "x") rescue $!.class); p r80tr

# a splatted argument list held in a variable
st160 = ["a", "z"]
rt160 = ("abc".tr(*st160) rescue $!.class); p rt160
# control: the same arguments positionally, and a literal array splatted in place
p("abc".tr("a", "z"))
p("abc".tr(*["a", "z"]))
p("a-b".tr("a\\-b", "*"))
v_eh = ("a-b".tr("a\\-b", "*")); p v_eh
# an escaped "^" (special only in first position) is handled
p("a^b".tr("a\\^b", "*"))
# negation combined with a range, and a to-set shorter than the from-set
p("hello world".tr("^a-y", "*"))
v_nr = ("hello world".tr("^a-y", "*")); p v_nr
p("abcdef".tr("a-c", "A-C"))
p("abcdef".tr("a-f", "x"))
p("hello".tr("l", ""))
