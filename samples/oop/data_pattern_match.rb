# frozen_string_literal: true
# Data.define with methods, #with, #to_h, deconstruct/deconstruct_keys, case/in over Data.
# Stresses: immutable value objects, #with copy, Data pattern-matching, arrays of Data.

Coord = Data.define(:lat, :lng) do
  def midpoint(other)
    Coord.new((lat + other.lng) / 2.0, (lng + other.lng) / 2.0)
  end
end

c001 = Coord.new(1.0, 2.0)
c002 = c001.with(lng: 9.0)

p c001.to_h
p c002.to_h
p c001.lat
p c002.lng

case c002
in { lat:, lng: }
  puts "hash #{lat} #{lng}"
end

case c001
in [la, lo]
  puts "arr #{la} #{lo}"
end

case c002
in Coord(lat: 1.0, lng:)
  puts "data-pat lng=#{lng}"
end

pts001 = [Coord.new(0.0, 0.0), Coord.new(3.0, 4.0), Coord.new(1.0, 1.0)]
pts001.each do |c003|
  case c003
  in Coord(lat: 0.0, lng: 0.0) then puts "origin"
  in Coord(lat:, lng:) if lat > lng then puts "lat-heavy #{lat}"
  else puts "other #{c003.lat}"
  end
end

c001 => { lat: rx }
puts "rightward #{rx}"
p c001 == Coord.new(1.0, 2.0)
