# frozen_string_literal: true
# StopIteration#result
# the return value of the enumerator whose exhaustion raised the StopIteration.

# Array#each returns the array, so an exhausted array enumerator's result is the array.
# Captured inside the rescue (cleanly typed) — the assignment form.
e001 = [10, 20].each; e001.next; e001.next
r001 = (begin; e001.next; rescue StopIteration => z001; z001.result; end); p r001

# Range#each returns the range.
e002 = (1..2).each; e002.next; e002.next
r002 = (begin; e002.next; rescue StopIteration => z002; z002.result; end); p r002

# a single-element enumerator, exhausted in one extra #next.
e003 = [42].each; e003.next
r003 = (begin; e003.next; rescue StopIteration => z003; z003.result; end); p r003

# an explicitly constructed StopIteration has no enumerator, so #result is nil.
p(StopIteration.new.result)
r004 = StopIteration.new.result; p r004

p(StopIteration.new("boom").result)
r005 = StopIteration.new("boom").result; p r005

# explicitly raising a constructed StopIteration: #result is still nil.
r006 = (begin; raise StopIteration.new("m"); rescue StopIteration => z006; z006.result; end); p r006

# Capturing the exception OBJECT out of the rescue makes the local a poly union
# (element | StopIteration); reading #result off it resolves correctly.
ex007 = (begin; e001.next; rescue StopIteration => z007; z007; end)
p ex007.result
r007 = ex007.result; p r007

# a Hash enumerator's result is the Hash; a String each_char enumerator's is the String
e008 = {a: 1}.each; e008.next
r008 = (begin; e008.next; rescue StopIteration => z008; z008.result; end); p r008
e009 = "ab".each_char; e009.next; e009.next
r009 = (begin; e009.next; rescue StopIteration => z009; z009.result; end); p r009

# StopIteration is an IndexError, and so a StandardError
p(StopIteration.ancestors.include?(IndexError))
a010 = (StopIteration <= StandardError); p a010
r011 = (begin; raise StopIteration, "m"; rescue IndexError => z011; z011.class.to_s; end); p r011

# a rescued StopIteration inside a loop body does not end the loop
e012 = [1].each
seen012 = []
count012 = 0
loop do
  count012 += 1
  break if count012 > 3
  begin
    seen012 << e012.next
  rescue StopIteration
    seen012 << :done
  end
end
p seen012
