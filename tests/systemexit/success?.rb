# frozen_string_literal: true
# SystemExit#success?
# status 0 => true
p(SystemExit.new.success?)
r001 = SystemExit.new.success?; p r001
p(SystemExit.new(0).success?)
p(SystemExit.new("bye").success?)

# any non-zero status => false
p(SystemExit.new(2).success?)
r002 = SystemExit.new(2).success?; p r002

# boolean argument: true => success, false => failure
p(SystemExit.new(true).success?)
p(SystemExit.new(false).success?)
r003 = SystemExit.new(false).success?; p r003

# status + message keeps the success? verdict
p(SystemExit.new(3, "custom").success?)

# a raised/rescued SystemExit reports its success?
begin; raise SystemExit.new(1); rescue SystemExit => e004; p e004.success?; end
r005 = (begin; raise SystemExit; rescue SystemExit => e005; e005.success?; end); p r005

# exit(n) then success? off the caught exit
begin; exit(0); rescue SystemExit => e006; p e006.success?; end
begin; exit(3); rescue SystemExit => e007; p e007.success?; end

# an ensure runs while a SystemExit unwinds, and the status survives
log005 = []
r005 = (begin
  begin
    exit(1)
  ensure
    log005 << :ensure
  end
rescue SystemExit => e005
  [e005.status, e005.success?]
end); p r005; p log005

# a bare `rescue` does NOT catch a SystemExit (it is not a StandardError)
r006 = (begin; begin; exit(2); rescue => x006; :std; end; rescue SystemExit => e006; [e006.status, e006.success?]; end); p r006
