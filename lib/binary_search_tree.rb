require_relative 'node'       # => true
require_relative 'null_node'  # => false

class BinarySearchTree
attr_accessor :head     # => nil

  def initialize(head = NullNode::DEFAULT)
    @head = head                            # => #<NullNode:0x007fba5b028218>
    @sorted_array = []                      # => []
  end

  def empty?
    @head == NullNode::DEFAULT  # => true, false, false, false, false
  end

  def insert(data, current = @head)
    if empty?                                                                   # => true, false, false
      @head = Node.new(data)                                                    # => #<Node:0x007fba5b022fc0 @data="d", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>
    else new_node = Node.new(data)                                              # => #<Node:0x007fba5b022908 @data="b", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, #<Node:0x007fba5b021da0 @data="f", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>
      if new_node.data < current.data && current.left == NullNode::DEFAULT      # => true, false
        current.left = new_node                                                 # => #<Node:0x007fba5b022908 @data="b", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>
      elsif new_node.data > current.data && current.right == NullNode::DEFAULT  # => true
        current.right = new_node                                                # => #<Node:0x007fba5b021da0 @data="f", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>
      elsif new_node.data < current.data
      current = current.left
      insert(data, current)
      else
      current = current.right
      insert(data, current)
      end                                                                       # => #<Node:0x007fba5b022908 @data="b", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, #<Node:0x007fba5b021da0 @data="f", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>
    end                                                                         # => #<Node:0x007fba5b022fc0 @data="d", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, #<Node:0x007fba5b022908 @data="b", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, #<Node:0x007fba5b021da0 @data="f", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>
    self                                                                        # => #<BinarySearchTree:0x007fba5b023510 @head=#<Node:0x007fba5b022fc0 @data="d", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, @sorted_array=[]>, #<BinarySearchTree:0x007fba5b023510 @head=#<Node:0x007fba5b022fc0 @data="d", @left=#<Node:0x007fba5b022908 @data="b", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, @right=#<NullNode:0x007fba5b028218>>, @sorted_array=[]>, #<BinarySearchTree:0x007fba5b023510 @head=#<Node:0x007fba5b022fc0 @data="d", @left=#<Node:0x007fba5b022908 @data="b", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, @right=#<Node:0x007fba5b021da0 @data="f", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>>, @sorted_array=[]>
  end

  def include?(data, current = @head)
    if empty?                                                               # => false
      false
    else
      if current == NullNode::DEFAULT || current.data == NullNode::DEFAULT  # => false
        return false
      elsif current.data == data                                            # => true
        return true                                                         # => true
      elsif data < current.data
        current = current.left
        include?(data, current)
      else
        current = current.right
        include?(data, current)
      end
    end
  end

  def depth_of(data, current = @head, count = 0)
    if empty?                                                                        # => false
      return "Empty tree!"
    else
      while current.right != NullNode::DEFAULT && current.left != NullNode::DEFAULT  # => true, false
        if data < current.data                                                       # => false
          current = current.left
          include?(data, current)
          count += 1
        elsif data > current.data                                                    # => true
          current = current.right                                                    # => #<Node:0x007fba5b021da0 @data="f", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>
          include?(data, current)                                                    # => true
          count += 1                                                                 # => 1
        else
          return count
        end
      end                                                                            # => nil
    end
    count                                                                            # => 1
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

  def sort(current = @head, parent = @head, sorted_array = @sorted_array)
    if current == NullNode::DEFAULT
      return
    else
      sort(current.left, parent)
      sorted_array << current.data
      sort(current.right, parent)
    end
    sorted_array
  end

  def delete(data, current = @head)
    if include?(data) == false
      puts "That node doesn't exist!"
    else
      while include?(data) == true
        if current == NullNode::DEFAULT
          break
        elsif current.data == data
          if current.right == NullNode::DEFAULT && current.left == NullNode::DEFAULT
            current.data = NullNode::DEFAULT
          else
            current.data = current.right.data
            current.right = NullNode::DEFAULT
          end
        elsif data < current.data
          current = current.left
          delete(data, current)
        else
          current = current.right
          delete(data,current)
        end
      end
    end
  end

end

tree = BinarySearchTree.new               # => #<BinarySearchTree:0x007fba5b023510 @head=#<NullNode:0x007fba5b028218>, @sorted_array=[]>
tree.insert("d").insert("b").insert("f")  # => #<BinarySearchTree:0x007fba5b023510 @head=#<Node:0x007fba5b022fc0 @data="d", @left=#<Node:0x007fba5b022908 @data="b", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>, @right=#<Node:0x007fba5b021da0 @data="f", @left=#<NullNode:0x007fba5b028218>, @right=#<NullNode:0x007fba5b028218>>>, @sorted_array=[]>
tree.depth_of("f")                        # => 1
