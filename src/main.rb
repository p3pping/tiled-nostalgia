require_relative '../lib/rendering/context.rb'
require_relative '../lib/factories/factories.rb'
require_relative '../lib/utilities/inputs.rb'
require_relative '../lib/utilities/input.rb'
require_relative '../lib/math/all.rb'
require_relative '../lib/utilities/tree_node.rb'
require_relative '../lib/nodes/sprite_node.rb'
require_relative 'nodes/player_node.rb'

input_state = Input.new()
context = Rendering::Context.new(800, 600, 5)
camera  = Factories::Camera.create(Vector2D.new(0,0), Rect.new(0, 0, 800, 600))
window  = Factories::Window.create("Tiled Nostalgia", context)
window.set_camera(camera) #TODO: make a camera node!

# TODO make a map node
tileset = Factories::Tileset.create(16, 16, './assets/default_tileset.png')
map     = Factories::Map.create('assets/map.csv', tileset)


# TODO: make this configurable in a scene file?
root = SceneNode.new('root')
player_node = PlayerNode.new('player')
player_sprite = SpriteNode.new('sprite')
player_node << player_sprite
root << player_node


window.on_input_pressed = Proc.new { |input_id| input_state.pressed(input_id) }
window.on_input_released = Proc.new { |input_id| input_state.released(input_id) }
window.update = Proc.new do |delta|
  if input_state.pressing?(INPUTS::ESC_KEY)
    window.close!
  end

  root.input(input_state)
  root.update(0.016)
end

window.draw = -> { map.draw and root.draw }
window.show
