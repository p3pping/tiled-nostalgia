require_relative '../lib/windows/window.rb'


window = Window.new(800, 600, caption: "Hello world")

window.update = Proc.new { |delta| puts "FPS: #{1.0/delta}" }
window.on_input_pressed = Proc.new { |input_id| puts "Pressed: #{input_id}" }
window.on_input_released = Proc.new { |input_id| puts "Released: #{input_id}" }
window.on_close = Proc.new { puts "Closing..." }

window.show