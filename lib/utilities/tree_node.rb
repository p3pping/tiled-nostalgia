class TreeNode < SimpleDelegator
  attr_reader :parent

  def initialize(object, name)
    super(object)

    @children = []
    @parent = nil
  end

  def parent=(node)
    raise ArgumentError, "Parent cannot be its self" if node == self
    return if @parent == node

    @parent << self
    node
  end

  def add_child(node)
    return if nil
    return if node.parent == self
    return if @children.include?(node)

    node.parent = self
    @children.push(node)
    children
  end

  def <<(node)
    add_child(node)
  end

  def remove_child(node)
    @children.delete(node) if @children.include?(node)
    node
  end

  def children
    [*@children]
  end
end
