# frozen_string_literal: true
# Fiber#resume
p(Fiber.new { 5 }.resume)

a001 = Fiber.new { 5 }
p a001.resume

b002 = 10
a002 = Fiber.new { |n| n * 3 }
p a002.resume(b002)

a003 = Fiber.new { 5 }
c003 = a003.resume
p c003.class
p c003

# driving a generator to exhaustion
a004 = Fiber.new do
  n = 1
  4.times do
    Fiber.yield(n)
    n *= 2
  end
  nil
end
d004 = []
while (v004 = a004.resume)
  d004 << v004
end
p d004
p a004.alive?

# the value passed back INTO the fiber becomes Fiber.yield's result
a005 = Fiber.new do
  got = Fiber.yield("first")
  "got=#{got}"
end
p a005.resume
p a005.resume("echo")

a006 = Fiber.new do
  got = Fiber.yield("first")
  "got=#{got}"
end
a006.resume
c006 = a006.resume("echo")
p c006

# resuming a dead fiber raises FiberError
a007 = Fiber.new { 1 }
a007.resume
r007 = (a007.resume rescue $!.class)
p r007

# yielding an Array
a008 = Fiber.new { Fiber.yield([1, 2, 3]); nil }
p a008.resume
a009 = Fiber.new { Fiber.yield([1, 2, 3]); nil }
c009 = a009.resume
p c009.class
p c009

# yielding a Hash
a010 = Fiber.new { Fiber.yield({ "k" => 1 }); nil }
c010 = a010.resume
p c010

# resume with no yield returns the body's value once
a011 = Fiber.new { "only" }
p a011.resume
p a011.alive?

# Fiber#resume with more than one argument.
a020 = Fiber.new { |x, y| x + y }
p a020.resume(3, 4)
a021 = Fiber.new { |x, y| x + y }
c021 = a021.resume(3, 4)
p c021
a022 = Fiber.new { |*a| a }
p a022.resume(1, 2)
