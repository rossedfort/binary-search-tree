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

  def include?(data, current = @head)
    if empty?
      false
    else
      if current == NullNode::DEFAULT
        return false
      elsif current.data == data
        return true
      elsif data < current.data
        current = current.left
        include?(data, current)
      else
        current = current.right
        include?(data, current)
      end
    end
  end

  def depth_of(data, current = @head)
    if empty?
      return "Empty tree!"
    else
      count = 0
      while current.right != NullNode::DEFAULT && current.left != NullNode::DEFAULT
        if current == NullNode::DEFAULT
          break
        elsif data > current.data
          current = current.right
          include?(data, current)
          count += 1
        elsif data < current.data
          current = current.left
          include?(data, current)
          count += 1
        else
          break
          count
        end
      end
    end
    count
  end

  def maximum
    
  end

end
# tree = BinarySearchTree.new                                                                                       # => #<BinarySearchTree:0x007fbb7a053f10 @head=#<NullNode:0x007fbb7a050a68>>
# tree.insert("d").insert("b").insert("f").insert("a").insert("c").insert("e").insert("g").insert("o").insert("z")  # => #<BinarySearchTree:0x007fbb7a053f10 @head=#<Node:0x007fbb7a03f9c0 @data="d", @left=#<Node:0x007fbb7a03f100 @data="b", @left=#<Node:0x007fbb7a03cec8 @data="a", @left=#<NullNode:0x007fbb7a050a68>, @right=#<NullNode:0x007fbb7a050a68>>, @right=#<Node:0x007fbb7891ebb0 @data="c", @left=#<NullNode:0x007fbb7a050a68>, @right=#<NullNode:0x007fbb7a050a68>>>, @right=#<Node:0x007fbb7a03e368 @data="f", @left=#<Node:0x007fbb7891c680 @data="e", @left=#<NullNode:0x007fbb7a050a68>, @right=#<NullNode:0x007fbb7a050a68>>, @right=#<Node:0x007fbb7a0358a8 @data="g", @left=#<NullNode:0x007fbb7a050a68>, @right=#<Node:0x007fbb7a02e580 @data="o", @left=#<NullNode:0x007fbb7a050a68>, @right=#<Node:0x007fbb7a024b20 @data="z", @left=#<NullNode:0x007fbb7a050a68>, @right=#<NullNode:0x007fbb7a050a68>>>>>>>
# tree.depth_of("b")                                                                                                # => 1
