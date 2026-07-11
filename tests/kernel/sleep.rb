# frozen_string_literal: true
# Kernel#sleep — sleep(0) returns immediately; returns the integer seconds slept
p(sleep(0).is_a?(Integer))
v501 = sleep(0); p(v501.is_a?(Integer))
