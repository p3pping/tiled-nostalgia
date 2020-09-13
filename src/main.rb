require_relative '../lib/windows/window.rb'
require_relative '../lib/rendering/tileset.rb'
require_relative '../lib/game_objects/factories/map_factory.rb'

tileset = Tileset.new(16, 16, './assets/default.png')
map = MapFactory.load('assets/map.csv', tileset)

window = Window.new(400, 300, caption: "Tiled Nostalgia")

window.draw = -> { map.draw }
window.on_close = -> { puts "Closing..." }

window.show
