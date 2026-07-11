# frozen_string_literal: true
# Symbol#length
p(:hello.length)
a017 = :hello; p(a017.length)
a018 = :hello; c018 = (a018.length); p c018
# Symbol#length counts bytes not characters for multibyte (runtime value diff)
p(:αβγ.length)
a020 = :αβγ; c020 = (a020.length); p c020
