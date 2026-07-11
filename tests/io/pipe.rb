# frozen_string_literal: true
# IO.pipe
p IO.pipe.class
r001, w001 = IO.pipe; p r001.class
