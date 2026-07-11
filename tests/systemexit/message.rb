# frozen_string_literal: true
# SystemExit#message (Exception#message)
# a string argument becomes the message
p(SystemExit.new("bye").message)
m001 = SystemExit.new("bye").message; p m001

# with an explicit status + message, the message is the second argument
p(SystemExit.new(3, "custom").message)
m002 = SystemExit.new(3, "custom").message; p m002

# a status-only (or no) argument uses the class name as the message
p(SystemExit.new.message)
m003 = SystemExit.new.message; p m003
p(SystemExit.new(2).message)
m004 = SystemExit.new(2).message; p m004

# a false status with a message keeps the message
p(SystemExit.new(false, "boom").message)
m005 = SystemExit.new(false, "boom").message; p m005

# message and to_s agree
a006 = SystemExit.new("z"); p(a006.message == a006.to_s)
r006 = (a006.message == a006.to_s); p r006

# a naturally-raised exit carries the class-name message
begin; exit(1); rescue SystemExit => e007; p e007.message; end
r008 = (begin; exit(2); rescue SystemExit => e008; e008.message; end); p r008
