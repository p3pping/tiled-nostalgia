require 'byebug'

class PlayerNode < SceneNode

  def initialize(name)
    super(name)
    @speed = 10.0
    @movement_direction = Vector2D.new(0.0, 0.0)
  end

  def input(state)
    super(state)
    y_direction = 0
    x_direction = 0

    if state.pressing?(INPUTS::W_KEY)
      y_direction = -1
    elsif state.pressing?(INPUTS::S_KEY)
      y_direction=1
    else
      y_direction = 0
    end

    if state.pressing?(INPUTS::A_KEY)
      x_direction = -1
    elsif state.pressing?(INPUTS::D_KEY)
      x_direction = 1
    else
      x_direction = 0
    end

    @movement_direction = Vector2D.new(x_direction, y_direction)
  end

  def update(delta)
    super(delta)
    @position = @position + (@movement_direction * @speed * delta)
    @sprite ||= find('sprite')
    @sprite.position = @position
  end
end
