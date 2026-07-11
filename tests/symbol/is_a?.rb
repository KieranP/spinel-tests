# frozen_string_literal: true
# Symbol#is_a?
p(:abc.is_a?(Symbol))
p(:abc.is_a?(Object))
p(:abc.is_a?(String))
a014 = :abc; p(a014.is_a?(Symbol))
a015 = :abc; v015 = a015.is_a?(String); p v015
