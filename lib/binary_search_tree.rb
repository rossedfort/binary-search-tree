require_relative 'node'       # => true
require_relative 'null_node'  # => false

class BinarySearchTree
attr_accessor :head     # => nil

  def initialize(head = NullNode::DEFAULT)
    @head = head                            # => #<NullNode:0x007faf1a841720>
  end

  def empty?
    @head == NullNode::DEFAULT  # => true, false, false, false, false
  end

  def insert(data, current = @head)
    if empty?                                                                   # => true, false, false, false
      @head = Node.new(data)                                                    # => #<Node:0x007faf1b80ab48 @data="d", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>
    else new_node = Node.new(data)                                              # => #<Node:0x007faf1b80a300 @data="b", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<Node:0x007faf1b809568 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>
      if new_node.data < current.data && current.left == NullNode::DEFAULT      # => true, false, true
        current.left = new_node                                                 # => #<Node:0x007faf1b80a300 @data="b", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>
      elsif new_node.data > current.data && current.right == NullNode::DEFAULT  # => false
        current.right = new_node
      elsif new_node.data < current.data                                        # => true
      current = current.left                                                    # => #<Node:0x007faf1b80a300 @data="b", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>
      insert(data, current)                                                     # => #<BinarySearchTree:0x007faf1b80b0e8 @head=#<Node:0x007faf1b80ab48 @data="d", @left=#<Node:0x007faf1b80a300 @data="b", @left=#<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>>
      else
      current = current.right
      insert(data, current)
      end                                                                       # => #<Node:0x007faf1b80a300 @data="b", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<BinarySearchTree:0x007faf1b80b0e8 @head=#<Node:0x007faf1b80ab48 @data="d", @left=#<Node:0x007faf1b80a300 @data="b", @left=#<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>>
    end                                                                         # => #<Node:0x007faf1b80ab48 @data="d", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<Node:0x007faf1b80a300 @data="b", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, #<BinarySearchTree:0x007faf1b80b0e8 @head=#<Node:0x007faf1b80ab48 @data="d", @left=#<Node:0x007faf1b80a300 @data="b", @left=#<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>>
    self                                                                        # => #<BinarySearchTree:0x007faf1b80b0e8 @head=#<Node:0x007faf1b80ab48 @data="d", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>>, #<BinarySearchTree:0x007faf1b80b0e8 @head=#<Node:0x007faf1b80ab48 @data="d", @left=#<Node:0x007faf1b80a300 @data="b", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>>, #<BinarySearchTree:0x007faf1b80b0e8 @head=#<Node:0x007faf1b80ab48 @data="d", @left=#<Node:0x007faf1b80a300 @data="b", @left=#<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>, @right=#<NullNode:0x007faf1a841720>>>, #<BinarySearchTree:0x007faf1b80b0e8 @head=#<Node:0x007faf1b80ab48 @data="d", @left=#<Node:0x007faf1b80a300 @data="b", @left=#<Node:0x007faf1b808e38 @data="a", @left=#<NullNode:0x007faf1a841720>, @right=#<NullNode:0x007f...
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
    if empty?                                   # => false
      return "Empty tree!"
    else
      until current.right == NullNode::DEFAULT  # => true
        current = current.right
      end                                       # => nil
      current.data                              # => "d"
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
