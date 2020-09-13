require_relative '../lib/windows/window.rb'


window = Window.new(800, 600, caption: "Tiled Nostalgia")

window.update = ->(delta) { puts "FPS: #{1.0/delta}" }
window.on_input_pressed   = ->(input_id) { puts "Pressed: #{input_id}" }
window.on_input_released  = ->(input_id) { puts "Released: #{input_id}" }
window.on_close = -> { puts "Closing..." }

window.show
