# frozen_string_literal: true
# Complex#floor (Complex does not define it — Ruby raises NoMethodError)

begin; Complex(2, 3).floor; rescue => e001; p e001.class; end
begin; Complex(2, 3).ceil; rescue => e002; p e002.class; end
begin; Complex(2, 3).round; rescue => e003; p e003.class; end
begin; Complex(2, 3).truncate; rescue => e004; p e004.class; end
begin; Complex(2, 3).positive?; rescue => e005; p e005.class; end
begin; Complex(2, 3).negative?; rescue => e006; p e006.class; end
begin; Complex(2, 3).totally_fake_zzz; rescue => e007; p e007.class; end
