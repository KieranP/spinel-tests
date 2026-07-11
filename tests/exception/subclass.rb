# frozen_string_literal: true
# User-defined Exception subclasses (Class#new / inheritance / rescue matching)
class AppError < StandardError; end
class DbError < AppError
  attr_reader :table
  def initialize(table, msg = "db failure")
    @table = table
    super(msg)
  end
end
class RowMissing < DbError
  def label; "row missing"; end
end

# the ancestry is reflectable
p(DbError < AppError)
p(RowMissing <= DbError)
p(RowMissing.superclass)
a001 = RowMissing.ancestors.include?(StandardError); p a001

# a three-deep instance built in a local carries its ivar and its message
e002 = RowMissing.new("users"); p e002.message; p e002.table; p e002.label
p(RowMissing.new("orders").table)

# rescuing by the base class catches the deepest subclass
begin; raise RowMissing.new("orders"); rescue AppError => e003; p e003.class; end
r003 = (begin; raise RowMissing, "t1"; rescue AppError => x003; x003.class.to_s; end); p r003

# rescuing by the middle class also catches it
begin; raise RowMissing.new("o"); rescue DbError => e004; p e004.message; end
r004 = (begin; raise RowMissing.new("o"); rescue DbError => x004; x004.class.to_s; end); p r004

# a user method on the rescue-bound exception, with a three-deep hierarchy
# (kept commented: the call is refused at compile time, which aborts the file)
begin; raise RowMissing.new("u"); rescue RowMissing => e005; p e005.label; end
r006 = (begin; raise RowMissing.new("u"); rescue DbError => x006; x006.table; end); p r006

# a two-deep hierarchy resolves the same call
class SimpleError < StandardError
  attr_reader :code
  def initialize(code); @code = code; super("simple"); end
end
begin; raise SimpleError.new(7); rescue SimpleError => e007; p e007.code; end
r007 = (begin; raise SimpleError.new(9); rescue SimpleError => x007; x007.code; end); p r007

# a subclass that overrides #message
class Overridden < StandardError
  def message; "overridden"; end
end
p(Overridden.new("ignored").message)
r008 = Overridden.new("ignored").message; p r008
begin; raise Overridden; rescue => e008; p e008.message; end
begin; raise Overridden; rescue Overridden => e008b; p e008b.message; end

# Exception#== across the hierarchy
p(DbError.new("t") == DbError.new("t"))
p(RowMissing.new("t") == DbError.new("t"))
r009 = (SimpleError.new(1) == SimpleError.new(1)); p r009

# #exception on a subclass instance keeps the class
e010 = SimpleError.new(3); f010 = e010.exception("other"); p f010.class; p f010.message
p(SimpleError.new(5).exception.class)

# #cause on a subclass instance
p(SimpleError.new(3).cause)

# a rescue-bound instance of the same subclass answers the same way
begin; raise SimpleError.new(4); rescue SimpleError => e011; p e011.cause; end
