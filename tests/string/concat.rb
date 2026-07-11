# frozen_string_literal: true
# String#concat
p((+"ab").concat("cd"))
a034 = +"ab"; a034.concat("cd"); p a034
a035 = +"ab"; b035 = +"cd"; a035.concat(b035); p a035
a036 = +"ab"; b036 = +"cd"; c036 = (a036.concat(b036)); p c036
# concat returns the receiver itself
a037 = +"ab"; p(a037.concat("cd").equal?(a037))
# multiple arguments, appended in order
p((+"a").concat("b", "c"))
a038 = +"a"; a038.concat("b", "c"); p a038
# an Integer argument is appended as a codepoint
a039 = +"ab"; a039.concat(99); p a039
a040 = +"ab"; a040.concat("c", 100); p a040
# zero arguments is a no-op returning the receiver
p((+"ab").concat)
a041 = +"ab"; a041.concat; p a041
# zero arguments on a frozen receiver must still raise
r042 = ("ab".concat rescue $!.class); p r042
z001 = +"ab"; v001 = z001.concat(99); p v001
# discarding the result of the same append compiles and matches
z002 = +"ab"; z002.concat(99); p z002
