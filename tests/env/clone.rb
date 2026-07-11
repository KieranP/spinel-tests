# frozen_string_literal: true
# ENV.clone
ENV['ZZ_A'] = '1'
# Ruby raises TypeError (ENV cannot be cloned); Spinel raises NameError (uninitialized constant ENV)
r001 = (ENV.clone rescue $!.class); p r001
