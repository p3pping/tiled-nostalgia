require_relative '../math/vector2d.rb'
require 'gosu'

class Camera
  attr_reader :position, :rect, :center

  def initialize(position, rect, center: Vector2D.new(rect.width/2, rect.height/2))
    @position = position
    @rect = rect
    @center = center
  end

  def set_position(position)
    @position = Vector2D.new(position.x, position.y) * -1
  end

  def set_center(center)
    @center = Vector2D.new(
      [@width,  center.x].min,
      [@height, center.y].min
    )
  end

  def size
    @rect.size
  end

  def render(context)
    return unless block_given?

    Gosu.translate(
      ((@position.x * context.scale_x) + @center.x),
      ((@position.y * context.scale_y) + @center.y)
    ) do
      yield
    end
  end
end
