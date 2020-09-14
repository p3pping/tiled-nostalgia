class Sprite
  attr_reader :position

  def initialize(renderable, position)
    @renderable = renderable
    @position = position
  end

  def change_position(position)
    @position = position
  end

  def change_layer(layer)
    @layer = layer
  end

  def draw
    @renderable.draw(@position.x, @position.y)
  end
end
