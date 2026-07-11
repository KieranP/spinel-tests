# frozen_string_literal: true
# KeyError#receiver
# explicit constructor records the receiver (works)
p(KeyError.new("m", key: :k, receiver: [1, 2]).receiver)
r001 = KeyError.new("m", key: :k, receiver: [1, 2]); p r001.receiver
r002 = KeyError.new("m", key: :k, receiver: {a: 1}).receiver; p r002

# natural raise reports the fetched hash as the receiver
h003 = {a: 1}; begin; h003.fetch(:x); rescue KeyError => e003; p e003.receiver; end
r004 = (begin; {a: 1}.fetch(:x); rescue KeyError => e004; e004.receiver; end); p r004

# the receiver is the same object that was fetched
h005 = {a: 1, b: 2}; begin; h005.fetch(:z); rescue KeyError => e005; p e005.receiver.equal?(h005); end
r006 = (h006 = {a: 1}; begin; h006.fetch(:z); rescue KeyError => e006; e006.receiver.equal?(h006); end); p r006

# a KeyError built without receiver: -> Ruby raises ArgumentError; Spinel returns nil
r007 = KeyError.new("m")
c007 = (r007.receiver rescue $!.class); p c007

# The error itself is raised and rescued correctly:
begin; {a: 1}.fetch(:x); rescue KeyError => e008; p e008.message; end
c009 = (begin; {a: 1}.fetch(:x); rescue KeyError => e009; e009.class; end); p c009

# a multi-entry hash reports itself as the receiver
r009 = (begin; {a: 1, b: 2}.fetch(:c); rescue KeyError => e009; e009.receiver; end); p r009
p(begin; {a: 1, b: 2}.fetch(:c); rescue KeyError => e010; e010.receiver; end)
