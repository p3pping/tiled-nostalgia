require_relative './scene_node.rb'
require_relative '../factories/factories.rb'

class SpriteNode < SceneNode
  def initialize(name)
    super(name)

    # TODO: make it so you can supply the sprite instead?
    @sprite = Factories::Sprite.create('./assets/default_sprite.png', 16, 16)
  end

  def update(delta)
    @sprite.change_position(@position)
  end

  def draw
    @sprite.draw
  end
end
