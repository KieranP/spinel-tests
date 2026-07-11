# frozen_string_literal: true
# Range#=== (case equality)
p((1..5) === 3)
v001 = ((1..5) === 3); p(v001)
p((..5) === 4)
v002 = ((..5) === 4); p(v002)
p((1..5) === (2..4))
v003 = ((1..5) === (2..4)); p(v003)
p((1..5) === 6)
p((1...5) === 5)
p((1..) === 100)
p((1.0..2.0) === 1.5)
v004 = ((1.0..2.0) === 1.5); p(v004)
p(("a".."e") === "c")
p(("a".."e") === "z")
p((-5..-1) === -3)

p((1..5) === 2.5)
p((nil..nil) === 3)
v005 = ((1..) === 100); p(v005)
p(("a".."e") === 3)
p((1..5) === "x")
v006 = ((1..5) === "x"); p(v006)
b007 = "x"; v007 = ((1..5) === b007); p(v007)

case 3 when (1..5) then p :in when nil then p :nil else p :out end
case 7 when (1..5) then p :in else p :out end
case "c" when "a".."e" then p :str_bare_in else p :str_bare_out end
case "z" when ("a".."e") then p :str_in else p :str_out end
case "c" when ("a".."e") then p :str_in else p :str_out end
s009 = "c"; case s009 when ("a".."e") then p :str_in else p :str_out end
v006 = (case 3
        in ..5 then :beginless
        else :miss
        end); p v006
v007 = (case 3
        in 1.. then :endless
        else :miss
        end); p v007
v008 = (case 7
        in 1..5 then :hit
        else :miss
        end); p v008

# so a matching value answers false
p([1..10].map { |r900| r900 === 5 })
v901 = [1..10].map { |r901| r901 === 5 }; p v901
p(["a".."e"].map { |r902| r902 === "c" })
v903 = ["a".."e"].map { |r903| r903 === "c" }; p v903
