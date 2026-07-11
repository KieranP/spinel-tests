# frozen_string_literal: true
# Float#eql?
p(1.5.eql?(1.5))
a029 = 1.5; b029 = 1.5; p(a029.eql?(b029))
a030 = 1.5; v030 = a030.eql?(a030); p v030

# eql? requires the same class — an Integer of equal value is not eql?
p(1.0.eql?(1))
p(1.0.eql?(1.0))
p(0.0.eql?(-0.0))
p(Float::NAN.eql?(Float::NAN))
p(1.5.eql?("1.5"))
a031 = 2.0; b031 = 2; v031 = a031.eql?(b031); p v031
