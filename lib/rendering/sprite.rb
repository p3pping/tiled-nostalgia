class Sprite
  attr_reader :position, :layer

  def initialize(renderable, position, layer: 0)
    @renderable = renderable
    @position = position
    @layer = layer
  end

  def change_position(position)
    @position = position
  end

  def change_layer(layer)
    @layer = layer
  end

  def draw
    @renderable.draw(@position.x, @position.y, @layer)
  end
end
