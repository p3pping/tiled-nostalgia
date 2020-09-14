class Renderable
  def initialize(image)
    @image = image
  end

  def draw(x, y, layer: 0)
    @image.draw(x, y, layer)
  end
end
