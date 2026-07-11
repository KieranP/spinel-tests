# frozen_string_literal: true
# NoMethodError#receiver
# a naturally-raised NoMethodError on nil records the receiver
begin; nil.foo; rescue NoMethodError => e001; p e001.receiver.inspect; end
# a heap-object receiver is recorded correctly
o001 = Object.new
begin; o001.bar(3); rescue NoMethodError => e002; p(e002.receiver.equal?(o001)); end
r001 = (begin; o001.bar(3); rescue NoMethodError => e003; e003.receiver.equal?(o001); end); p r001
# a String / Integer receiver should also be recorded
begin; "s".no_such; rescue NoMethodError => e004; p e004.receiver; end
r002 = (begin; "s".no_such; rescue NoMethodError => e005; e005.receiver; end); p r002
begin; 42.no_such; rescue NoMethodError => e006; p e006.receiver; end
# the explicit constructor stores the receiver: keyword (works)
p(NoMethodError.new("m", :nm, [1], false, receiver: 7).receiver)
r003 = NoMethodError.new("m", :nm, [1], false, receiver: 7).receiver; p r003

# an Array literal receiver
r004 = (begin; [1].nope; rescue NoMethodError => e007; e007.receiver; end); p r004
# a Symbol literal receiver
r005 = (begin; :s.nope; rescue NoMethodError => e008; e008.receiver; end); p r005
# a parenthesized Hash literal receiver
r006 = (begin; ({a: 1}).nope; rescue NoMethodError => e009; e009.receiver; end); p r006
# a user-class instance receiver
class Plain010; def pub; 1; end; end
r007 = (begin; Plain010.new.nope; rescue NoMethodError => e010; e010.class.to_s; end); p r007

# holding the receiver in a local first
sym011 = :s
begin; sym011.no_such; rescue NoMethodError => e011; p e011.receiver; end
arr012 = [1]
begin; arr012.no_such; rescue NoMethodError => e012; p e012.receiver; end
hsh013 = {a: 1}
begin; hsh013.no_such; rescue NoMethodError => e013; p e013.receiver; end
p [sym011, arr012, hsh013]
