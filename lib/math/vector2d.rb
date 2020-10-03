class Vector2D
  attr_reader :x, :y

  def initialize(x, y)
    @x = x.to_f
    @y = y.to_f
  end

  def +(vector)
    Vector2D.new(@x+vector.x, @y+vector.y)
  end

  def -(vector)
    Vector2D.new(@x-vector.x, @y-vector.y)
  end

  def *(scalar)
    scalar_float = scalar.to_f
    Vector2D.new(@x*scalar_float, @y*scalar_float)
  end

  def /(scalar)
    scalar_float = scalar.to_f
    Vector2D.new(@x/scalar_float, @y/scalar_float)
  end

  def magnitude
    Math.sqrt((@x**2)+(@y**2))
  end

  def sqr_magnitude
    (@x**2)+(@y**2)
  end

  def to_a
    [@x, @y]
  end
end
