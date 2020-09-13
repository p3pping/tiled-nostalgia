require_relative '../lib/windows/window.rb'
require_relative '../lib/rendering/tileset.rb'
require_relative '../lib/game_objects/factories/map_factory.rb'

tileset = Tileset.new(32, 32, './assets/default.png')
map = MapFactory.load('assets/map.csv', tileset)

window = Window.new(800, 600, caption: "Tiled Nostalgia")

window.update = ->(delta) { puts "FPS: #{1.0/delta}" }
window.on_input_pressed   = ->(input_id) { puts "Pressed: #{input_id}" }
window.on_input_released  = ->(input_id) { puts "Released: #{input_id}" }
window.draw = -> { map.draw }
window.on_close = -> { puts "Closing..." }

window.show
