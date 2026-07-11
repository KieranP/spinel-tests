# frozen_string_literal: true
# Error cases use `rescue` so both interpreters run to completion.

# Kernel — retry inside begin/rescue with an ensure clause
c130 = true
begin
  raise "x"
rescue
  (c130 = false; retry) if c130
ensure
  puts "ens"
end
