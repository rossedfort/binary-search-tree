require 'minitest/autorun'
require 'minitest/emoji'
require './lib/node'

class NodeTests < Minitest::Test
  def test_make_a_node_with_data
    assert Node.new("a")
  end
end
