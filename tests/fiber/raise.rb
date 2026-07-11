# frozen_string_literal: true
# Fiber#raise

# raising into a fiber suspended at a yield delivers the exception there
a001 = Fiber.new do
  begin
    Fiber.yield("waiting")
  rescue ArgumentError
    "caught inside"
  end
end
p a001.resume
p a001.raise(ArgumentError, "nope")

a002 = Fiber.new do
  begin
    Fiber.yield("waiting")
  rescue ArgumentError
    "caught inside"
  end
end
a002.resume
c002 = a002.raise(ArgumentError, "nope")
p c002.class
p c002

# an unrescued raise propagates out of #raise into the caller
a003 = Fiber.new { Fiber.yield("waiting"); "end" }
a003.resume
r003 = (a003.raise(RuntimeError, "boom") rescue $!.class)
p r003

a004 = Fiber.new { Fiber.yield("waiting"); "end" }
a004.resume
r004 = (a004.raise(RuntimeError, "boom") rescue $!.message)
p r004

# raising into a never-resumed fiber is a FiberError
a005 = Fiber.new { Fiber.yield(1) }
r005 = (a005.raise(RuntimeError, "boom") rescue $!.class)
p r005

# raising into a dead fiber is a FiberError
a006 = Fiber.new { 1 }
a006.resume
r006 = (a006.raise(RuntimeError, "boom") rescue $!.class)
p r006
