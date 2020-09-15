require 'gosu'
require_relative '../rendering/renderable.rb'
require_relative '../rendering/sprite.rb'
require_relative '../utilities/vector2d.rb'

module Factories
  class Sprite
    def self.create(file, width, height)
      ::Sprite.new(
        Renderable.new(Gosu::Image.load_tiles(file, width, height)[0]),
        Vector2D.new(0, 0)
      )
    end
  end
end
