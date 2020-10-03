require_relative '../lib/rendering/context.rb'
require_relative '../lib/factories/factories.rb'
require_relative '../lib/utilities/inputs.rb'
require_relative '../lib/math/all.rb'

context = Rendering::Context.new(800, 600, 5)
camera  = Factories::Camera.create(Vector2D.new(0,0), Rect.new(0, 0, 800, 600))
window  = Factories::Window.create("Tiled Nostalgia", context)
window.set_camera(camera)

tileset = Factories::Tileset.create(16, 16, './assets/default_tileset.png')
map     = Factories::Map.create('assets/map.csv', tileset)
sprite  = Factories::Sprite.create('./assets/default_sprite.png', 16, 16)

window.on_input_pressed = Proc.new do |input_id|
  case input_id
    when INPUTS::W_KEY
      sprite.change_position(sprite.position + Vector2D.new(0,-1))
    when INPUTS::S_KEY
      sprite.change_position(sprite.position + Vector2D.new(0, 1))
    when INPUTS::A_KEY
      sprite.change_position(sprite.position + Vector2D.new(-1, 0))
    when INPUTS::D_KEY
      sprite.change_position(sprite.position + Vector2D.new(1, 0))
    when INPUTS::ESC_KEY
      window.close!
  end
  camera.set_position(sprite.position)
end

window.draw = -> { map.draw and sprite.draw }
window.show
