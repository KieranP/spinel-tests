# frozen_string_literal: true
# Range#group_by
p((1..4).group_by(&:even?))
a019 = (1..4); p(a019.group_by(&:even?))
a020 = (1..4); c020 = (a020.group_by(&:even?)); p c020
