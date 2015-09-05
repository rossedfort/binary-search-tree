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

  def test_inserts_a_smaller_node_to_the_left
    tree = BinarySearchTree.new
    tree.insert("d").insert("b").insert("a")
    assert_equal "b", tree.head.left.data
    assert_equal "a", tree.head.left.left.data
  end

  def test_inserts_a_larer_node_to_the_right
    tree = BinarySearchTree.new
    tree.insert("d").insert("f").insert("g")
    assert_equal "f", tree.head.right.data
    assert_equal "g", tree.head.right.right.data
  end

  def test_include_returns_true_for_an_element_in_the_tree
    tree = BinarySearchTree.new
    tree.insert("d").insert("b").insert("a")
    assert_equal true, tree.include?("a")
    assert_equal false, tree.include?("c")
  end

  def test_depth_of_returns_the_depth_of_the_element_in_the_tree
    tree = BinarySearchTree.new
    tree.insert("d")
    tree.insert("b")
    assert_equal 0, tree.depth_of("d")
    assert_equal 1, tree.depth_of("b").count
  end
end
