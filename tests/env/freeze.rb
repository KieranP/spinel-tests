# frozen_string_literal: true
# ENV.freeze
ENV['ZZ_A'] = '1'
# Ruby raises TypeError (ENV cannot be frozen); Spinel raises NameError (uninitialized constant ENV)
r001 = (ENV.freeze rescue $!.class); p r001
