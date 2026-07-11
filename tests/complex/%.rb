# frozen_string_literal: true
# Complex#% / #div / #modulo / #divmod / #remainder / #gcd
# (Complex defines none of these — Ruby raises NoMethodError)

begin; Complex(2, 3) % 2; rescue => e001; p e001.class; end
begin; Complex(2, 3).div(2); rescue => e002; p e002.class; end
begin; Complex(2, 3).modulo(2); rescue => e003; p e003.class; end
begin; Complex(2, 3).divmod(2); rescue => e004; p e004.class; end
begin; Complex(2, 3).remainder(2); rescue => e005; p e005.class; end
begin; Complex(2, 3).gcd(2); rescue => e006; p e006.class; end
