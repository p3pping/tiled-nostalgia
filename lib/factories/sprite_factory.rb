require 'gosu'
require_relative '../rendering/sprite.rb'
require_relative '../utilities/vector2d.rb'

class SpriteFactory
  def self.create(file, width, height)
    Sprite.new(
      Gosu::Image.load_tiles(file, width, height)[0],
      Vector2D.new(0, 0)
    )
  end
end
