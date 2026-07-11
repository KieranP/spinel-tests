# frozen_string_literal: true
# Ranked-choice-ish vote tallying with elimination rounds.
# Inference: tally over Symbols, min_by/max_by on the count pairs, reject to
# drop an eliminated candidate, and sort_by for stable ordering.

BALLOTS = [
  %i[alice bob carol],
  %i[bob alice carol],
  %i[carol bob alice],
  %i[alice carol bob],
  %i[bob carol alice],
  %i[alice bob carol],
  %i[carol alice bob],
].freeze

def round_counts(ballots, eliminated)
  ballots.map { |b| b.find { |c| !eliminated.include?(c) } }.compact.tally
end

eliminated = []
round = 1
winner = nil
loop do
  counts = round_counts(BALLOTS, eliminated)
  total = counts.values.sum
  puts "round #{round}: #{counts.sort.inspect}"
  leader, votes = counts.max_by { |_c, v| v }
  if votes * 2 > total
    winner = leader
    break
  end
  loser, = counts.min_by { |_c, v| v }
  eliminated << loser
  round += 1
  break if counts.size <= 1
end

puts "winner: #{winner}"
puts "eliminated order: #{eliminated.inspect}"

first_choices = BALLOTS.map(&:first).tally
puts "first choices: #{first_choices.sort.inspect}"
p BALLOTS.flatten.tally.sort
