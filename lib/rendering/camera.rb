require_relative '../math/vector2d.rb'
require 'gosu'

class Camera
  attr_reader :position, :rect, :center

  def initialize(position, rect, center: Vector2D.new(0, 0))
    @position = position
    @rect = rect
    @center = center
  end

  def set_position(position)
    @position = Vector2D.new(position.x, position.y)
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

    Gosu.clip_to(
      (@position.x * context.scale_x) + @rect.left,
      (@position.y * context.scale_y)  + @rect.top,
      @rect.width,
      @rect.height,
    ) do
      yield
    end
  end
end
