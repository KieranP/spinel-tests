# frozen_string_literal: true
# FrozenError#receiver
FeStruct = Struct.new(:x)

# String receiver is reported correctly (natural frozen mutation).
p(begin; "x".freeze << "y"; rescue FrozenError => e001; e001.receiver; end)
r002 = (begin; "x".freeze << "y"; rescue FrozenError => e002; e002.receiver; end); p r002
p(begin; "x".freeze << "y"; rescue FrozenError => e003; e003.receiver.class; end)

# Array receiver — reported correctly now.
p(begin; [1].freeze << 2; rescue FrozenError => e004; e004.receiver; end)
r005 = (begin; [1].freeze << 2; rescue FrozenError => e005; e005.receiver; end); p r005

# Hash receiver — Ruby reports {a: 1}; Spinel returns nil.
p(begin; h006 = {a: 1}.freeze; h006[:b] = 2; rescue FrozenError => e006; e006.receiver; end)
r007 = (begin; h007 = {a: 1}.freeze; h007[:b] = 2; rescue FrozenError => e007; e007.receiver; end); p r007

# Struct receiver — Ruby reports the struct; Spinel returns nil.
p(begin; s008 = FeStruct.new(1).freeze; s008.x = 5; rescue FrozenError => e008; e008.receiver; end)

# Explicit construction with the receiver: keyword reports the object correctly.
f009 = FrozenError.new("nope", receiver: [7, 8, 9])
p(f009.receiver)
r010 = f009.receiver; p r010

# A FrozenError built without a receiver: Ruby raises ArgumentError; Spinel returns nil.
p(begin; FrozenError.new("x").receiver; rescue => e011; e011.class; end)

# a String frozen through a local, then mutated
s012 = +"x"; s012.freeze
p(begin; s012 << "y"; rescue FrozenError => e012; e012.receiver; end)
# a SECOND mutation of the same frozen local (kept commented: it aborts the C build)
r013 = (begin; s012 << "y"; rescue FrozenError => e013; e013.receiver.class; end); p r013

# a frozen Array mutated by #push and by #sort!
p(begin; [1].freeze.push(2); rescue FrozenError => e014; e014.class; end)
r015 = (begin; a015 = [2, 1].freeze; a015.sort!; rescue FrozenError => e015; e015.class.to_s; end); p r015
