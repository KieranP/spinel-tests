# frozen_string_literal: true
# Kernel#Complex
p(Complex(2, 3))
c001 = Complex(2, 3); p(c001)
p(Complex(1))
c002 = Complex(1); p(c002)
p(Complex("2+3i"))
c003 = Complex("2+3i"); p(c003)

p(Complex(2.5))
c004 = Complex(2.5); p(c004)
p(Complex(2, 3.0))
c005 = Complex(2, 3.0); p(c005)
p(Complex(-4, 5))
c006 = Complex(-4, 5); p(c006)

p(Complex("-2-3i"))
c007 = Complex("-2-3i"); p(c007)
p(Complex("2i"))
c008 = Complex("2i"); p(c008)
p(Complex("0.5+0.5i"))
c009 = Complex("0.5+0.5i"); p(c009)
p(Complex("3"))
c010 = Complex("3"); p(c010)

s011 = "1+2i"
p(s011.class)
c011 = Complex(s011); p(c011)

x012 = 2
y012 = 3
c012 = Complex(x012, y012); p(c012)

# unparseable string / nil now raise correctly
begin; p(Complex("bad")); rescue => e013; p e013.class; end
begin; p(Complex("")); rescue => e014; p e014.class; end
begin; p(Complex(nil)); rescue => e016; p e016.class; end
begin; p(Complex("1+")); rescue => e015; p e015.class; end

begin; p(Complex(1, 2, 3)); rescue => e017; p e017.class; end

p(Complex("6/2").real == 3)
c018 = Complex("6/2"); p(c018.real == 3)

begin; p(Complex()); rescue => e019; p e019.class; end

# the exception: keyword on a String that parses
p(Complex("1+2i", exception: false))
c019 = Complex("1+2i", exception: false); p c019
# on a String that does not parse the keyword is ignored and ArgumentError is raised,
# which takes the whole file down, so these are kept commented
p(Complex("bad", exception: false))
c020 = Complex("bad", exception: false); p c020
