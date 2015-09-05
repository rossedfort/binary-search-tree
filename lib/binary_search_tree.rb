require_relative 'node'
require_relative 'null_node'

class BinarySearchTree
attr_accessor :head

  def initialize(head = NullNode::DEFAULT)
    @head = head
  end

  def empty?
    @head == NullNode::DEFAULT
  end

  def insert(data, current = @head)
    if empty?
      @head = Node.new(data)
    else new_node = Node.new(data)
      if new_node.data < current.data && current.left == NullNode::DEFAULT
        current.left = new_node
      elsif new_node.data > current.data && current.right == NullNode::DEFAULT
        current.right = new_node
      elsif new_node.data < current.data
      current = current.left
      insert(data, current)
      else
      current = current.right
      insert(data, current)
      end
    end
    self
  end

#   def include?(data, current = @head)
#     if empty?
#       false
#     else
#       if
#       end
#     end

end
    # BinarySearchTree.new.insert("d").insert("b").insert("a").insert("c").insert("f").insert("e").insert("g")
