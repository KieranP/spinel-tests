# frozen_string_literal: true
# rescue
# a bare rescue clause catches StandardError
begin; raise "x"; rescue => e001; p e001.class; end
r001 = (begin; raise "x"; rescue => x001; x001.class; end); p r001

# two classes listed in one clause
begin; raise TypeError, "t"; rescue ArgumentError, TypeError => e002; p e002.class; end
r002 = (begin; raise ArgumentError, "a"; rescue ArgumentError, TypeError => x002; x002.class; end); p r002

# among several clauses the first matching one in source order wins
begin; raise TypeError, "pick"; rescue ArgumentError; p :arg; rescue TypeError => e003; p e003.class; end
r003 = (begin; raise ArgumentError, "pick"; rescue ArgumentError => x003; x003.class; rescue TypeError; :type; end); p r003

# rescuing by an ancestor class
begin; raise ArgumentError, "a"; rescue StandardError => e004; p e004.class; end
r004 = (begin; raise ArgumentError, "a"; rescue Exception => x004; x004.class; end); p r004

# a splatted array of exception classes
klasses005 = [ArgumentError, TypeError]
begin; raise TypeError, "t"; rescue *klasses005 => e005; p e005.class; end
r005 = (begin; raise ArgumentError, "a"; rescue *klasses005 => x005; x005.class; end); p r005

# no matching clause: the exception propagates to the outer handler
begin
  begin; raise TypeError, "prop"; rescue ArgumentError; p :never; end
rescue TypeError => e006
  p e006.message
end
r006 = (begin; begin; raise TypeError, "prop"; rescue ArgumentError; :never; end; rescue TypeError => x006; x006.message; end); p r006

# the rescue modifier
p((Integer("zz") rescue :bad))
v007 = (Integer("zz") rescue :bad); p v007
p((1 rescue :bad))
v008 = (1 rescue :bad); p v008
v009 = (raise("m") rescue $!.message); p v009

# an else clause runs only when the body raised nothing
log010 = []
begin; log010 << :body; rescue; log010 << :rescue; else; log010 << :else; ensure; log010 << :ensure; end
p log010
log011 = []
begin; raise "x"; rescue; log011 << :rescue; else; log011 << :else; ensure; log011 << :ensure; end
p log011

# an exception raised inside a rescue clause propagates outward
begin
  begin; raise "inner"; rescue; raise TypeError, "from-handler"; end
rescue => e012
  p e012.message
end
r012 = (begin; begin; raise "inner"; rescue; raise TypeError, "from-handler"; end; rescue => x012; x012.class; end); p r012

# $! is the current exception inside the handler and nil once it has finished
begin; raise ArgumentError, "cur"; rescue; p $!.class; end
p $!

# rescue in a block body (do…end form): every element comes back nil
r013 = [1, 2].map do |i|
  raise ArgumentError, "x" if i == 1
  i
rescue ArgumentError
  :handled
end
p r013

# the same handler written as an explicit begin/rescue inside the block is correct
p([1, 2].map { |i| begin; raise ArgumentError, "x" if i == 1; i; rescue ArgumentError; :handled; end })

# a rescue clause whose operand is not a class raises TypeError in Ruby
r014 = (begin; begin; raise "x"; rescue 5; :matched; end; rescue TypeError => e014; e014.class.to_s; end); p r014

# a clause splatting an empty array matches nothing, so the exception propagates
empty015 = []
r015 = (begin; begin; raise ArgumentError, "a"; rescue *empty015; :matched; end; rescue ArgumentError => e015; e015.message; end); p r015

# a begin/rescue expression assigned to a local, whose body assigns a local of its own
r016 = (begin; a016 = [1]; a016; rescue; 0; end); p r016
r017 = (begin; a017 = 1; a017; rescue => e017; e017.class; end); p r017
# the same shape with an Array body and a Class handler (kept commented since it aborts the file)
r020 = (begin; a020 = [1].freeze; a020 << 2; rescue FrozenError => e020; e020.class; end); p r020
# the same expression printed directly, and the class stringified in the branch, both build
p(begin; a021 = [1].freeze; a021 << 2; rescue FrozenError => e021; e021.class; end)
r022 = (begin; a022 = [1].freeze; a022 << 2; rescue FrozenError => e022; e022.class.to_s; end); p r022

# printing the same expression directly, or hoisting the assignment out, is correct
p(begin; a018 = [1]; a018; rescue; 0; end)
a019 = [1]; r019 = (begin; a019; rescue; 0; end); p r019

# a block-driving call to a yielding method, inside a begin/rescue expression,
# where the block raises (kept commented since it aborts the file)
def wrap020
  yield
end
r020 = (begin; wrap020 { raise ArgumentError, "d" }; rescue => e020; 0; end); p r020

# the statement form of the same call compiles and matches
begin; wrap020 { raise ArgumentError, "d" }; rescue => e021; p e021.message; end
