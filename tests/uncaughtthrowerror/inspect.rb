# frozen_string_literal: true
# UncaughtThrowError#inspect
e001 = (throw :zz, 3 rescue $!); p e001.inspect
i002 = (throw :zz, 3 rescue $!).inspect; p i002

# `p` on the object uses inspect
e003 = (throw :q rescue $!); p e003
