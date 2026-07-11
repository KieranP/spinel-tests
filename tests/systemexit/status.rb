# frozen_string_literal: true
# SystemExit#status
# an integer argument is the status
p(SystemExit.new(2).status)
s001 = SystemExit.new(2).status; p s001

# no argument (or a string-only argument) => status 0
p(SystemExit.new.status)
s002 = SystemExit.new.status; p s002
p(SystemExit.new("bye").status)
s003 = SystemExit.new("bye").status; p s003

# boolean argument: true => 0, false => 1
p(SystemExit.new(true).status)
p(SystemExit.new(false).status)
s004 = SystemExit.new(false).status; p s004

# explicit status + message keeps the status
p(SystemExit.new(3, "custom").status)
a005 = 3; b005 = "custom"; c005 = SystemExit.new(a005, b005); p c005.status

# a raised SystemExit is a valid raise/rescue target and carries its status
begin; raise SystemExit.new(7); rescue SystemExit => e006; p e006.status; end
r007 = (begin; raise SystemExit; rescue SystemExit => e007; e007.status; end); p r007

# exit(n) raises a rescuable SystemExit carrying n
begin; exit(4); rescue SystemExit => e008; p e008.status; end
begin; exit(false); rescue SystemExit => e009; p e009.status; end

# Kernel#abort raises a rescuable SystemExit (status 1); Spinel exits instead (kept last so it truncates only itself)
r010 = (begin; abort("boom"); rescue SystemExit => e010; e010.status; end); p r010
