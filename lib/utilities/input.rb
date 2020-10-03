class Input
  def initialize()
    @pressed = []
  end

  def pressed(input)
    @pressed << input
  end

  def pressing?(input)
    @pressed.include?(input)
  end

  def released(input)
    @pressed.delete(input)
  end

  def released?(input)
    !pressing(input)
  end
end
