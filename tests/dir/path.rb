# frozen_string_literal: true
# Dir#path
d001 = "/tmp/sp_dir_path_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
r001 = (begin; d002 = Dir.new(d001); s001 = d002.path; d002.close; s001.class.to_s; rescue => e001; e001.class.to_s; end); p r001
Dir.rmdir(d001)
