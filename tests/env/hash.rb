# frozen_string_literal: true
# ENV.hash
ENV['ZZ_A'] = '1'
# ENV.hash should return an Integer; Spinel raises NameError (uninitialized constant ENV)
r001 = (ENV.hash rescue $!.class); p r001.is_a?(Integer)
