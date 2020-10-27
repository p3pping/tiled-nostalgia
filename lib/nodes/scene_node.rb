require_relative '../utilities/tree_node.rb'
require_relative '../math/vector2d.rb'

class SceneNode < TreeNode
  attr_reader :position

  def initialize(name, position=Vector2D.new(0.0, 0.0))
    super(name)

    @position = position
  end

  def position=(new__position)
    raise ArgumentError, 'position must be a Vector2D' unless new__position.is_a?(Vector2D)

    @position = new__position
  end

  def input(state)
    children.each { |child| child.input(state) }
  end

  def update(delta)
    children.each { |child| child.update(delta) }
  end

  def draw
    children.each(&:draw)
  end
end
