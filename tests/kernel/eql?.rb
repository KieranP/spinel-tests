# frozen_string_literal: true
# Kernel#eql?
p(Object.new.eql?(Object.new))
a029 = Object.new; b029 = Object.new; p(a029.eql?(b029))
a030 = Object.new; v030 = a030.eql?(a030); p v030
