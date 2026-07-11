# frozen_string_literal: true
class Box001; X001 = 1; Y001 = 2; end

# Class#constants
p(Box001.constants.sort)
v001 = Box001.constants; p v001.sort
p(Box001.constants.length)

module Layout950
  WIDTH950 = 24
  module Border950
    def self.wrap(text) = "|#{text}|"
  end
end
p(Layout950.constants.sort)
v951 = Layout950.constants.sort; p v951
