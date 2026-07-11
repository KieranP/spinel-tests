# frozen_string_literal: true
# Exception matching in case/when (Module#=== with an exception operand)

# rescue-clause matching against a built-in Exception class works
begin; raise ArgumentError, "a"; rescue StandardError => e001; p e001.class; end

# a user-defined exception class matches its own instance via explicit ===
class UErr002 < StandardError; end
p(UErr002 === UErr002.new)
r002 = (UErr002 === UErr002.new); p r002

p(case ArgumentError.new("x") when ArgumentError then "A" else "?" end)
r003 = (case ArgumentError.new("x") when ArgumentError then "A" else "?" end); p r003
begin
  raise TypeError, "t"
rescue => e004
  p(case e004 when TypeError then "T" else "?" end)
  r004 = (case e004 when TypeError then "T" else "?" end); p r004
end

p(StandardError === ArgumentError.new("x"))
r005 = (StandardError === ArgumentError.new("x")); p r005
