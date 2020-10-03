require_relative '../lib/rendering/context.rb'
require_relative '../lib/factories/factories.rb'
require_relative '../lib/utilities/inputs.rb'
require_relative '../lib/utilities/input.rb'
require_relative '../lib/math/all.rb'

input_state = Input.new()
context = Rendering::Context.new(800, 600, 5)
camera  = Factories::Camera.create(Vector2D.new(0,0), Rect.new(0, 0, 800, 600))
window  = Factories::Window.create("Tiled Nostalgia", context)
window.set_camera(camera)

tileset = Factories::Tileset.create(16, 16, './assets/default_tileset.png')
map     = Factories::Map.create('assets/map.csv', tileset)
sprite  = Factories::Sprite.create('./assets/default_sprite.png', 16, 16)

window.on_input_pressed = Proc.new { |input_id| input_state.pressed(input_id) }
window.on_input_released = Proc.new { |input_id| input_state.released(input_id) }
window.update = Proc.new do |delta|
  if input_state.pressing?(INPUTS::W_KEY)
    sprite.change_position(sprite.position + Vector2D.new(0,-1))
  end
  if input_state.pressing?(INPUTS::S_KEY)
    sprite.change_position(sprite.position + Vector2D.new(0, 1))
  end
  if input_state.pressing?(INPUTS::A_KEY)
    sprite.change_position(sprite.position + Vector2D.new(-1, 0))
  end
  if input_state.pressing?(INPUTS::D_KEY)
    sprite.change_position(sprite.position + Vector2D.new(1, 0))
  end
  if input_state.pressing?(INPUTS::ESC_KEY)
    window.close!
  end
  camera.set_position(sprite.position)
end

window.draw = -> { map.draw and sprite.draw }
window.show
