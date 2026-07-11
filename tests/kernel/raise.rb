# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# Kernel#raise (and its alias #fail)
r491 = (raise "boom" rescue $!.message); p r491
r492 = (raise ArgumentError, "bad" rescue $!.class); p r492
r493 = (raise ArgumentError rescue $!.message); p r493
r494 = (raise rescue $!.class); p r494
r495 = (fail "via fail" rescue $!.message); p r495

# raising a non-Exception, non-class value raises TypeError
r496 = (raise 42 rescue $!.class); p r496
r497 = (raise [1, 2] rescue $!.class); p r497

# raising an exception instance directly
r498 = (raise ArgumentError.new("inst") rescue $!.message); p r498

r499 = (raise String rescue $!.class); p r499
