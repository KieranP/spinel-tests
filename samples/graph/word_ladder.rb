# frozen_string_literal: true
# Word-ladder BFS: string neighbors, Set visited, queue of paths.
require 'set'

def neighbors(word, dict)
  result = []
  word.chars.each_with_index do |_, i|
    ("a".."z").each do |c|
      cand = word.dup
      cand[i] = c
      result << cand if cand != word && dict.include?(cand)
    end
  end
  result
end

dict = Set.new(%w[hit hot dot dog cog log lot])

def ladder(start, goal, dict)
  queue = [[start]]
  seen = Set.new([start])
  until queue.empty?
    path = queue.shift
    return path if path.last == goal
    neighbors(path.last, dict).each do |n|
      next if seen.include?(n)
      seen << n
      queue << (path + [n])
    end
  end
  nil
end

path = ladder("hit", "cog", dict)
puts "ladder: #{path.join(" -> ")}"
puts "length: #{path.length}"
puts "neighbors of hot: #{neighbors("hot", dict).sort.inspect}"
