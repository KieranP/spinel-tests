# frozen_string_literal: true
# Symbol#size
p(:hello.size)
v011 = (:hello.size); p v011
a019 = :hello; p(a019.size)
v012 = (a019.size); p v012
# Symbol#size counts bytes not characters for multibyte (runtime value diff)
p(:café.size)
a021 = :café; c021 = (a021.size); p c021
