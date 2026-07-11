# frozen_string_literal: true
# ENV.to_s
ENV['ZZ_A'] = '1'
# ENV.to_s should return "ENV"; Spinel raises NameError (uninitialized constant ENV)
r001 = (ENV.to_s rescue $!.class); p r001
