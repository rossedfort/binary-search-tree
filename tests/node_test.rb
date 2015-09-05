require 'minitest/autorun'
require 'minitest/emoji'
require './lib/node'

class NullNodeTests < Minitest::Test
  def test_make_a_node_with_data
    assert Node.new("a")
  end
end
