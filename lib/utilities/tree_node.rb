class TreeNode
  attr_reader :parent, :name

  def initialize(name)
    @name=name
    @children = []
    @parent = nil
  end

  def parent=(node)
    @parent = nil and return if node.nil?
    raise ArgumentError, "Parent cannot be its self" if node == self
    return if @parent == node

    @parent = node
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
    node.parent = nil
    node
  end

  def children
    [*@children]
  end

  def find(path)
    final_node = path.index('/').nil?
    if final_node
      destination_nodes = children.select { |child| child.name == path}
      destination_nodes.any? ? destination_nodes[0] : nil
    else
      delimiter_index = path.index('/')
      children.map { |child| child.find(path[delimiter_index+1...]) }.compact
    end
  end

  def root
    find_root_of(self)
  end

  protected

  def find_root_of(node=self)
    return node if node.parent.nil?

    find_root_of(node.parent)
  end
end
