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

  def insert(value, current = @head)

  end
end


# bst.insert("d")
#   bst.insert.left("b")
#     bst.insert.left.left("a")
#     bst.insert.left.right("c")
#   bst.insert.right("f")
#     bst.insert.left.right("e")
#     bst.insert.right.right("g")
