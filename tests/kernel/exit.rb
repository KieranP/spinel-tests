# frozen_string_literal: true
# Kernel#exit — raises SystemExit, which `rescue SystemExit` observes
begin; exit(3); rescue SystemExit => e001; p e001.status; p e001.success?; end
begin; exit(0); rescue SystemExit => e002; p e002.status; p e002.success?; end
begin; exit(true); rescue SystemExit => e003; p e003.status; end
begin; exit(false); rescue SystemExit => e004; p e004.status; end
begin; exit; rescue SystemExit => e005; p e005.class; end
v006 = (begin; exit(2); rescue SystemExit => e006; e006.status; end); p v006

# A modifier `rescue` rescues StandardError only, so it must NOT catch SystemExit:
# under Ruby the process ends here and nothing below is printed.
r007 = (exit(1) rescue "caught"); p r007
puts "not reached under Ruby"
