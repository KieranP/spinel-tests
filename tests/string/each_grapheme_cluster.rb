# frozen_string_literal: true
# String#each_grapheme_cluster
p("abc".each_grapheme_cluster { |c| c })
v083 = ("abc".each_grapheme_cluster { |c| c }); p v083
