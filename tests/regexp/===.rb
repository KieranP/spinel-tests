# frozen_string_literal: true
# Regexp#===
p(/ell/ === "hello")
p(/xyz/ === "hello")
a001 = /ell/; p(a001 === "hello")
a002 = /ell/; b002 = "hello"; p(a002 === b002)
a003 = /ell/; v003 = (a003 === "hello"); p v003

# === against a Symbol matches its name; a non-String / nil operand is false
p(/a/ === :abc)
p(/a/ === 1)
p(/a/ === nil)
a004 = :abc; v004 = (/a/ === a004); p v004

# === sets the match globals
/(e)l/ === "hello"; p $1
v005 = (/(e)l/ === "hello"); w005 = $~[1]; p w005

# case/when dispatches on ===
case "hello"
when /(e)l/ then p $1
else p :none
end

p([/b/].map { |r900| r900 === "abc" })
v901 = [/b/].map { |r901| r901 === "abc" }; p v901
