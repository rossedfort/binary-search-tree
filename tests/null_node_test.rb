require 'minitest/autorun'
require 'minitest/emoji'
require './lib/null_node'

class NullNodeTests < Minitest::Test
  def test_make_a_null_node
    assert NullNode.new
  end
end
