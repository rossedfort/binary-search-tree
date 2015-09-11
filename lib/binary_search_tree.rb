require_relative 'node'
require_relative 'null_node'

class BinarySearchTree
  attr_accessor :head

  def initialize(head = NullNode::DEFAULT)
    @head = head
    @sorted_array = []
    @leaves = []
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
      return false
    else
      if current == NullNode::DEFAULT || current.data == NullNode::DEFAULT
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

  def depth_of(data, current = @head, count = 0)
    if empty?
      return 'Empty tree!'
    else
      while current.right != NullNode::DEFAULT && current.left != NullNode::DEFAULT
        if data < current.data
          current = current.left
          include?(data, current)
          count += 1
        elsif data > current.data
          current = current.right
          include?(data, current)
          count += 1
        else
          return count
        end
      end
    end
    count
  end

  def maximum(current = @head)
    if empty?
      return 'Empty tree!'
    else
      current = current.right until current.right == NullNode::DEFAULT
      current.data
    end
  end

  def minimum(current = @head)
    if empty?
      return 'Empty tree!'
    else
      current = current.left until current.left == NullNode::DEFAULT
      current.data
    end
  end

  def sort(current = @head, parent = @head, sorted_array = @sorted_array)
    if current == NullNode::DEFAULT
      return 'Empty tree!'
    else
      sort(current.left, parent)
      sorted_array << current.data
      sort(current.right, parent)
      sorted_array
    end
  end

  def delete(data, current = @head)
    if include?(data) == false
      return 'That node doesnt exist!'
    else
      while include?(data) == true
        if current == NullNode::DEFAULT
          break
        elsif current.data == data
          if current.left == NullNode::DEFAULT && current.right != NullNode::DEFAULT
            current.data = current.right.data
            current.right = NullNode::DEFAULT
          elsif current.right == NullNode::DEFAULT && current.left != NullNode::DEFAULT
            current.data = current.left.data
            current.left = NullNode::DEFAULT
          else
            current.data = NullNode::DEFAULT
          end
        elsif data < current.data
          current = current.left
          delete(data, current)
        else
          current = current.right
          delete(data, current)
        end
      end
    end
  end

  def maximum_height
    depth_of(maximum)
  end

  def num_of_leaves(current = @head, leaves = @leaves)
    if current == NullNode::DEFAULT
      return 0
    else
      if current.right == NullNode::DEFAULT && current.left == NullNode::DEFAULT
        leaves << current
      end
      num_of_leaves(current.left, leaves)
      num_of_leaves(current.right, leaves)
    end
    leaves.count
  end

  def input_tree
    handle = File.open('data.txt')
    handle.each_line do |l|
      insert("#{l.chomp}")
    end
  end

  def output_tree
    handle = File.open('output.txt', 'w')
    handle.write("The sorted elements:\n")
    sort.each do |n|
      handle.write("#{n}\n")
    end
  end
end

tree = BinarySearchTree.new
tree.input_tree
tree.delete('c')
tree.output_tree
