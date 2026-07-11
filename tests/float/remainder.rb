# frozen_string_literal: true
# Float#remainder (self - other * (self / other).truncate; sign follows the dividend)
p(7.5.remainder(2))
r001 = (7.5.remainder(2)); p r001
a001 = 7.5; b001 = 2; r002 = (a001.remainder(b001) rescue $!.class); p r002
r003 = ((-7.5).remainder(2) rescue $!.class); p r003
r004 = (7.5.remainder(-2) rescue $!.class); p r004
r005 = (7.5.remainder(2.5) rescue $!.class); p r005

# Float#remainder by zero (Ruby raises ZeroDivisionError, as Integer#remainder does)
r880 = (7.0.remainder(0.0) rescue $!.class); p r880
r881 = (7.0.remainder(0) rescue $!.class); p r881
v882 = 7.0; w882 = 0.0; r882 = (v882.remainder(w882) rescue $!.class); p r882

# sign follows the dividend, both operands negative
p((-7.5).remainder(-2.0))
v883 = -7.5; w883 = -2.0; x883 = (v883.remainder(w883)); p x883
