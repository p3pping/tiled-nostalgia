require 'gosu'
require_relative '../lib/factories/window_factory.rb'
require_relative '../lib/factories/tileset_factory.rb'
require_relative '../lib/factories/map_factory.rb'
require_relative '../lib/factories/sprite_factory.rb'
require_relative '../lib/utilities/inputs.rb'

tileset = Factories::Tileset.create(16, 16, './assets/default_tileset.png')
map     = Factories::Map.create('assets/map.csv', tileset)
sprite  = Factories::Sprite.create('./assets/default_sprite.png', 16, 16)
window  = Factories::Window.create(400, 300, caption: "Tiled Nostalgia")

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
