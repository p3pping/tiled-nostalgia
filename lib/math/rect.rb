class Rect
  attr_reader :left, :top, :width, :height
  def initialize(left, top, width, height)
    @top = top
    @left = left
    @width = width
    @height = height
  end

  def size
    Vector2D.new(@width, @height)
  end
end
