# frozen_string_literal: true
# ENV.dup
ENV['ZZ_A'] = '1'
# Ruby raises TypeError (ENV cannot be duped); Spinel raises NameError (uninitialized constant ENV)
r001 = (ENV.dup rescue $!.class); p r001
