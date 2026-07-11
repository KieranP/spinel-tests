# frozen_string_literal: true
# KeyError#key
# explicit constructor records the key (works)
p(KeyError.new("m", key: :k, receiver: {}).key)
k001 = KeyError.new("m", key: :k, receiver: {}); p k001.key
k002 = KeyError.new("m", key: :k, receiver: {}).key; p k002

# String key preserved through the constructor
p(KeyError.new("m", key: "sk", receiver: {}).key)
k003 = KeyError.new("m", key: "sk", receiver: {}).key; p k003

# natural raise from a Symbol-keyed hash reports the Symbol
h005 = {a: 1}; begin; h005.fetch(:b); rescue KeyError => e005; p e005.key; end
k006 = (begin; {a: 1}.fetch(:b); rescue KeyError => e006; e006.key; end); p k006

# natural raise with a String key (well-typed String-keyed hash) reports the String
h007 = {"x" => 1}; begin; h007.fetch("sk"); rescue KeyError => e007; p e007.key; end
k008 = (begin; {"x" => 1}.fetch("sk"); rescue KeyError => e008; e008.key; end); p k008

# well-typed Integer-keyed hash reports the Integer key
h009 = {5 => 0}; begin; h009.fetch(9); rescue KeyError => e009; p e009.key; end
k010 = (begin; {5 => 0}.fetch(9); rescue KeyError => e010; e010.key; end); p k010

# an empty-Hash literal fetched with a Symbol: Ruby reports the Symbol; Spinel a String
begin; {}.fetch(:missing); rescue KeyError => e011; p e011.key; end

# ENV.fetch of a missing name: reading #key directly in the rescue now reports the String.
begin; ENV.fetch("SP_NOPE_ZZ"); rescue KeyError => e012; p e012.key; end
# capturing the KeyError into a local then reading #key is a compile-time reject (kept commented)
c012 = (begin; {5 => 0}.fetch(9); rescue KeyError => x012; x012; end); p c012.key

# a KeyError built without key: -> Ruby raises ArgumentError; Spinel returns nil
k013 = KeyError.new("m")
r013 = (k013.key rescue $!.class); p r013

# an empty-Hash literal fetched with an Integer aborts C compilation (kept commented)
r014 = ({}.fetch(5) rescue $!.class); p r014

# The error itself is raised and rescued correctly:
begin; {}.fetch(:x); rescue KeyError => e015; p e015.class; end
c016 = (begin; {}.fetch(:x); rescue KeyError => e016; e016.class; end); p c016

# Hash#fetch_values reports the first missing key
k017 = (begin; {a: 1}.fetch_values(:a, :b); rescue KeyError => e017; e017.key; end); p k017
# Hash#fetch with a block never raises, so no KeyError is produced
p({a: 1}.fetch(:z) { |k| k })
k018 = {a: 1}.fetch(:z) { |k| k }; p k018
