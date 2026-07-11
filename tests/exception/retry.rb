# frozen_string_literal: true
# retry
# retry re-runs the begin block; a counter bounds it
count001 = 0
begin
  count001 += 1
  raise "again" if count001 < 3
  p count001
rescue
  retry
end

# retry succeeds on the second attempt, result captured
attempts002 = 0
r002 = begin
  attempts002 += 1
  raise ArgumentError, "no" if attempts002 == 1
  "ok-#{attempts002}"
rescue ArgumentError
  retry
end
p r002

# retry only re-enters begin; the count reflects total attempts
tries003 = 0
seen003 = []
begin
  tries003 += 1
  seen003 << tries003
  raise "x" if tries003 < 3
rescue
  retry
end
p seen003

# retry driven by inspecting $! inside the handler
n004 = 0
begin
  n004 += 1
  raise TypeError, "t" if n004 < 2
  p n004
rescue
  retry if $!.is_a?(TypeError)
end

# retry inside a method-level rescue
def m005(state)
  state[:n] += 1
  raise "again" if state[:n] < 3
  state[:n]
rescue
  retry
end
st005 = {n: 0}; p m005(st005)
st006 = {n: 0}; v006 = m005(st006); p v006

# a bounded retry that re-raises once the guard is exhausted
n007 = 0
r007 = (begin
  begin
    n007 += 1
    raise ArgumentError, "no"
  rescue ArgumentError
    retry if n007 < 3
    raise
  end
rescue => e007
  [n007, e007.class.to_s]
end); p r007

# ensure runs once per attempt
log008 = []
n008 = 0
begin
  n008 += 1
  log008 << :try
  raise "x" if n008 < 2
rescue
  retry
ensure
  log008 << :ensure
end
p log008
