require_relative 'null_node'

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = NullNode::DEFAULT
    @right = NullNode::DEFAULT
  end
end

Node.new(:data)
