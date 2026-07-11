# frozen_string_literal: true
# Build a small directory tree, walk it, and report disk usage per directory and
# per extension — a du(1)-style tool exercising Dir and File. The tree is created
# and removed by the script itself, so the output is stable.

ROOT = "/tmp/spinel_du_demo"

TREE = {
  "README.md" => "# demo project\n\nnothing to see here\n",
  "Rakefile" => "task :default\n",
  "lib/app.rb" => "module App\n  VERSION = \"1.0\"\nend\n",
  "lib/app/parser.rb" => "module App\n  class Parser\n    def parse(s) = s.split\n  end\nend\n",
  "lib/app/writer.rb" => "module App\n  class Writer; end\nend\n",
  "test/parser_test.rb" => "require \"minitest/autorun\"\n",
  "test/fixtures/small.txt" => "a\n",
  "test/fixtures/large.txt" => ("x" * 400) + "\n",
  "doc/index.md" => "# docs\n"
}.freeze

# create `relative` (a path with no leading slash) beneath an existing `root`
def mkdir_p(root, relative)
  return if relative.empty?

  grown = root
  relative.split("/").each do |part|
    grown = "#{grown}/#{part}"
    Dir.mkdir(grown) unless Dir.exist?(grown)
  end
end

# Teardown walks an explicit list rather than a live directory handle, so a rerun
# always starts from the same state.
def teardown(root, relatives)
  relatives.each do |relative|
    path = "#{root}/#{relative}"
    File.delete(path) if File.exist?(path)
  end
  dirs = relatives.filter_map do |relative|
    slash = relative.rindex("/")
    slash && relative[0, slash]
  end
  dirs.uniq.sort_by { |d| -d.count("/") }.each do |d|
    full = "#{root}/#{d}"
    Dir.rmdir(full) if Dir.exist?(full)
  end
  Dir.rmdir(root) if Dir.exist?(root)
end

teardown(ROOT, TREE.keys)
Dir.mkdir(ROOT) unless Dir.exist?(ROOT)
TREE.each do |relative, body|
  slash = relative.rindex("/")
  mkdir_p(ROOT, slash ? relative[0, slash] : "")
  File.write("#{ROOT}/#{relative}", body)
end

def walk(dir)
  found = []
  Dir.children(dir).sort.each do |name|
    path = "#{dir}/#{name}"
    if File.directory?(path)
      found.concat(walk(path))
    else
      found << path
    end
  end
  found
end

files = walk(ROOT)

def rel(path) = path.delete_prefix("#{ROOT}/")
def human(bytes) = bytes < 1024 ? "#{bytes}B" : format("%.1fK", bytes / 1024.0)

puts "tree rooted at #{ROOT}"
files.each do |path|
  ext = File.extname(path)
  puts format("  %-28s %6s  %s", rel(path), human(File.size(path)), ext.empty? ? "(no ext)" : ext)
end
puts

total = files.sum { |f| File.size(f) }
puts "#{files.size} files, #{human(total)} total"
puts

puts "per directory (recursive)"
dirs = files.map { |f| f[0, f.rindex("/")] }.uniq.sort
dirs.each do |dir|
  own = files.select { |f| f.start_with?("#{dir}/") }
  label = dir == ROOT ? "." : rel(dir)
  depth = dir == ROOT ? 0 : label.count("/") + 1
  puts format("  %-28s %6s  %d file(s)", ("  " * depth) + label,
              human(own.sum { |f| File.size(f) }), own.size)
end
puts

puts "per extension"
by_ext = files.group_by { |f| File.extname(f) }
by_ext.sort_by { |ext, fs| [-fs.sum { |f| File.size(f) }, ext] }.each do |ext, fs|
  bytes = fs.sum { |f| File.size(f) }
  share = (bytes * 100) / total
  puts format("  %-8s %6s  %3d%%  %-12s %s",
              ext.empty? ? "(none)" : ext, human(bytes), share,
              "#" * (share / 8), fs.map { |f| File.basename(f) }.sort.join(", "))
end
puts

puts "largest files"
files.sort_by { |f| -File.size(f) }.take(3).each_with_index do |f, i|
  puts format("  %d. %-28s %s", i + 1, rel(f), human(File.size(f)))
end
puts

sample = files.first
puts "file predicates on #{rel(sample)}"
puts "  exist?     #{File.exist?(sample)}"
puts "  file?      #{File.file?(sample)}"
puts "  directory? #{File.directory?(sample)}"
puts "  zero?      #{File.zero?(sample)}"
puts "  extname    #{File.extname(sample).inspect}"
puts "  basename   #{File.basename(sample).inspect}"
puts "  no-ext     #{File.basename(sample, '.*').inspect}"
puts "  dirname    #{File.dirname(sample).inspect}"
puts

puts "line counts"
files.select { |f| File.extname(f) == ".rb" }.sort.each do |f|
  lines = File.readlines(f)
  puts format("  %-28s %2d line(s), longest %2d chars", rel(f), lines.size,
              lines.map { |l| l.chomp.length }.max)
end
puts

puts "reading back a fixture"
body = File.read("#{ROOT}/test/fixtures/large.txt")
puts "  bytes         #{body.bytesize}"
puts "  first 8 chars #{body[0, 8].inspect}"
puts "  all x's       #{body.chomp.chars.uniq == ['x']}"
puts

puts "globbing"
[
  "#{ROOT}/*",
  "#{ROOT}/lib/**/*.rb",
  "#{ROOT}/**/*.txt"
].each do |pattern|
  hits = Dir.glob(pattern).sort.map { |p| rel(p) }
  puts format("  %-20s %d hit(s)  %s", pattern.delete_prefix("#{ROOT}/"), hits.size, hits.join(", "))
end

teardown(ROOT, TREE.keys)
puts
puts "cleaned up: #{!Dir.exist?(ROOT)}"
