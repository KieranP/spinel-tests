# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# Kernel — $! inside a rescue
r128 = (raise "boom" rescue $!.message); p r128

# $! is nil outside any rescue, and back to nil once a rescue has finished
p $!
r129 = (raise "a" rescue $!.class); p r129
p $!.nil?
r130 = (raise "b" rescue 1); p r130
p $!

# after a modifier rescue catches a bare re-raise, $! is left set
def reraise131; raise "c"; rescue; raise; end
r131 = (reraise131 rescue 2); p r131
p $!
begin; reraise131; rescue; end
p $!
