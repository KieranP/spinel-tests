# frozen_string_literal: true
# ENV.inspect
ENV['ZZ_A'] = '1'
# ENV.inspect should return a String; Spinel raises NameError (uninitialized constant ENV)
s001 = (ENV.inspect rescue $!.class); p s001.is_a?(String)
