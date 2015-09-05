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

  def maximum(current = @head)
    if empty?
      return "Empty tree!"
    else
      until current.right == NullNode::DEFAULT
        current = current.right
      end
      current.data
    end
  end

  def minimum(current = @head)
    if empty?
      return "Empty tree!"
    else
      until current.left == NullNode::DEFAULT
        current = current.left
      end
      current.data
    end
  end

end
