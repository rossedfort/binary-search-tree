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
require './lib/null_node'
require './lib/node'


class BinarySearchTreeTests < Minitest::Test
  def test_make_a_new_binary_search_tree
    tree = BinarySearchTree.new
    assert tree
  end

  def test_insert_a_single_node
    tree = BinarySearchTree.new
    tree.insert("d")
    assert_equal "d", tree.head.data
  end

  def test_if_the_tree_is_nonempty_traverse_down_until_the_node_is_inserted_in_the_correct_place
    tree = BinarySearchTree.new
    tree.insert("d")
    tree.insert("b")
    tree.insert("a")
    assert_equal "b", tree.head.left.data
    assert_equal "a", tree.head.left.left.data
  end
end
