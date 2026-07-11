# frozen_string_literal: true
# Ranking pipelines: rank, dense_rank, percentile reading scores out of hashes (container-element receivers)
players = [
  { name: "Ann", score: 88 },
  { name: "Bob", score: 92 },
  { name: "Cy",  score: 88 },
  { name: "Dee", score: 75 },
  { name: "Eve", score: 92 },
  { name: "Fay", score: 60 },
]

# sort descending by score, tie-break by name (tuple key reading out of the hash)
ranked = players.sort_by { |h| [-h[:score], h[:name]] }
p ranked.map { |h| h[:name] }

# standard competition rank (1224)
scores_desc = players.map { |h| h[:score] }.sort.reverse
p scores_desc
ranks = {}
ranked.each_with_index do |h, i|
  s = h[:score]
  ranks[h[:name]] = scores_desc.index(s) + 1
end
p ranks

# dense rank (1223)
distinct = players.map { |h| h[:score] }.uniq.sort.reverse
p distinct
dense = {}
ranked.each do |h|
  dense[h[:name]] = distinct.index(h[:score]) + 1
end
p dense

# percentile: fraction of players with a strictly lower score
all_scores = players.map { |h| h[:score] }
pct = {}
players.sort_by { |h| h[:name] }.each do |h|
  below = all_scores.count { |s| s < h[:score] }
  pct[h[:name]] = (below * 100.0 / all_scores.size).round(1)
end
p pct

# min_by / max_by / minmax_by reading out of hashes
p players.max_by { |h| h[:score] }[:name]
p players.min_by { |h| h[:score] }[:name]
top2 = players.max_by(2) { |h| h[:score] }
p top2.map { |h| h[:name] }
mm = players.minmax_by { |h| h[:score] }
p mm.map { |h| h[:name] }

# reading a method off the block param (container element)
lengths = players.sort_by { |h| h[:name].length }
p lengths.map { |h| h[:name] }

# group by score bucket then rank within
buckets = players.group_by { |h| h[:score] >= 90 ? :A : (h[:score] >= 75 ? :B : :C) }
buckets.each { |k, v| buckets[k] = v.map { |h| h[:name] }.sort }
p buckets.sort.to_h
