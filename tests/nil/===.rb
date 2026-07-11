# frozen_string_literal: true
# NilClass#===
p(nil === nil)
r146a = (nil === nil); p r146a
r146b = (nil === false); p r146b
n005 = nil; p(n005 === nil)
# receiver and argument both in variables
n006 = nil; a006 = nil; p(n006 === a006)
n007 = nil; a007 = 0; v007 = (n007 === a007); p v007
# === against more values (same as ==)
p(nil === true)
p(nil === "")
# nil as a case/when pattern
def classify008(x)
  case x
  when nil then "was-nil"
  when Integer then "was-int"
  else "other"
  end
end
p(classify008(nil))
p(classify008(5))
p(classify008("s"))
# capture the case result via a variable subject
subj009 = nil
r009 = case subj009; when nil then :matched; else :no; end
p r009
