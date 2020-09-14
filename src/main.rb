require 'gosu'
require_relative '../lib/windows/window.rb'
require_relative '../lib/rendering/tileset.rb'
require_relative '../lib/factories/map_factory.rb'
require_relative '../lib/factories/sprite_factory.rb'
require_relative '../lib/utilities/inputs.rb'

tileset = Tileset.new(16, 16, './assets/default_tileset.png')
map = MapFactory.load('assets/map.csv', tileset)

sprite = SpriteFactory.create('./assets/default_sprite.png', 16, 16)

window = Window.new(400, 300, caption: "Tiled Nostalgia")

window.on_input_pressed = Proc.new do |input_id|
  case input_id
    when INPUTS::W_KEY
      sprite.change_position(sprite.position + Vector2D.new(0,-1))
    when INPUTS::S_KEY
      sprite.change_position(sprite.position + Vector2D.new(0,1))
  end
end

window.draw = -> { map.draw and sprite.draw }

window.show
