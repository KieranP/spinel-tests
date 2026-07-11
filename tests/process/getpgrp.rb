# frozen_string_literal: true
# Process.getpgrp

# Process group id (Integer); the raw value is non-deterministic across processes,
# so only class/positivity is asserted.
p(Process.getpgrp.class)
a001 = Process.getpgrp; p a001.class
r001 = (Process.getpgrp > 0 rescue $!.class); p r001
