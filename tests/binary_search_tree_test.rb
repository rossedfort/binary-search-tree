# make a new binary search tree
#   tree should be empty
# -----------------------------
# make a null node
#   the null node is always pointed at from left and right by all nodes without a left or right node
# ------------------------------------------------------
# make a new null node and insert it into the tree
#   if the tree is empty it makes the new node the head
#   if the tree is nonempty traverse down the tree until the node is in the correct place based on comparison with other nodes
#
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/binary_search_tree'

class BinarySearchTreeTests < Minitest::Test
  def test_make_a_new_binary_search_tree
    assert BinarySearchTree.new
  end
end
