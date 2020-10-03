class Input
  @@pressed = []

  def self.pressed(input)
    @@pressed << input
  end

  def self.pressing?(input)
    @@pressed.include?(input)
  end

  def self.released(input)
    @@pressed.delete(input)
  end

  def self.released?(input)
    !pressing(input)
  end
end
