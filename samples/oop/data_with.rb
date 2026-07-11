# frozen_string_literal: true
# Immutable Data records updated with #with and matched with case/in.
# Inference: Data.define instances, #with producing a fresh copy, and pattern
# matching that deconstructs keyword fields must keep the field types intact.

Coord = Data.define(:lat, :lng) do
  def to_s = "(#{lat}, #{lng})"
end

origin = Coord.new(0.0, 0.0)
moved = origin.with(lat: 10.0)

puts moved.to_s
puts origin.to_s
p moved.lat
p origin.lat

case moved
in { lat:, lng: }
  p [lat, lng]
end

route = [Coord.new(1.0, 2.0), Coord.new(3.0, 4.0), Coord.new(5.0, 6.0)]
shifted = route.map { |c| c.with(lng: c.lng + 1.0) }
p shifted.map(&:lng)
p route.sum(&:lat)
p route.max_by(&:lng).to_s
