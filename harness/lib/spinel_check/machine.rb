# frozen_string_literal: true

module SpinelCheck
  # What this box has to spend. Probed once; Darwin first (this is where the harness
  # runs), Linux /proc as the fallback, then a conservative guess so a probe failure
  # degrades to a small budget rather than an unbounded one.
  module Machine
    module_function

    def cpus
      @cpus ||= sysctl('hw.ncpu') || nproc || 4
    end

    def ram_mb
      @ram_mb ||= sysctl('hw.memsize')&.fdiv(1024 * 1024)&.to_i || meminfo_mb || 8192
    end

    def sysctl(key)
      read_int("sysctl -n #{key} 2>/dev/null")
    end

    def nproc
      read_int('nproc 2>/dev/null')
    end

    def meminfo_mb
      read_int("awk '/MemTotal/ {print int($2/1024)}' /proc/meminfo 2>/dev/null")
    end

    def read_int(command)
      `#{command}`.to_i.nonzero?
    rescue StandardError
      nil
    end
  end
end
