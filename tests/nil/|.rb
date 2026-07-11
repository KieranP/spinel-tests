# frozen_string_literal: true
# NilClass#|
p(nil | true)
p(nil | false)
p(nil | nil)
p(nil | 0)
n017 = nil; p(n017 | true)
v025 = (n017 | true); p v025
n018 = nil; p(n018 | false)
n019 = nil; p(n019 | 0)
n020 = nil; v026 = (n020 | 5); p v026
n021 = nil; p(n021 | 0.0)
# receiver and argument both in variables (nil | x is truthiness of x)
n022 = nil; a022 = false; p(n022 | a022)
n023 = nil; a023 = 5; v027 = (n023 | a023); p v027
# more argument types
p(nil | :sym)
p(nil | [])
p(nil | "")
n024 = nil; p(n024 | Object.new)
# result used in a condition
r028 = (nil | 0)
p(r028 == true)
r029 = (nil | nil)
p(r029 == false)
