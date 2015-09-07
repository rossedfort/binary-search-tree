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
    tree.insert('d')
    assert_equal 'd', tree.head.data
  end

  def test_inserts_a_smaller_node_to_the_left
    tree = BinarySearchTree.new
    tree.insert('d').insert('b').insert('a')
    assert_equal 'b', tree.head.left.data
    assert_equal 'a', tree.head.left.left.data
  end

  def test_inserts_a_larer_node_to_the_right
    tree = BinarySearchTree.new
    tree.insert('d').insert('f').insert('g')
    assert_equal 'f', tree.head.right.data
    assert_equal 'g', tree.head.right.right.data
  end

  def test_include_returns_true_for_an_element_in_the_tree
    tree = BinarySearchTree.new
    tree.insert('d').insert('b').insert('a')
    assert_equal true, tree.include?('a')
    assert_equal false, tree.include?('c')
  end

  def test_include_doesnt_break_when_the_tree_is_empty
    tree = BinarySearchTree.new
    assert_equal false, tree.include?('a')
  end

  def test_depth_of_returns_the_depth_of_the_element_in_the_tree
    tree = BinarySearchTree.new
    tree.insert('d').insert('b').insert('f')
    assert_equal 0, tree.depth_of('d')
    assert_equal 1, tree.depth_of('b')
    assert_equal 1, tree.depth_of('f')
  end

  def test_depth_of_doesnt_blow_up_when_the_tree_is_empty
    tree = BinarySearchTree.new
    assert_equal 'Empty tree!', tree.depth_of('a')
  end

  def test_maximum_returns_the_data_of_the_largest_element_in_the_tree
    tree = BinarySearchTree.new
    tree.insert('c').insert('b').insert('a')
    assert_equal 'c', tree.maximum
  end

  def test_maximum_doesnt_blow_up_when_the_tree_is_empty
    tree = BinarySearchTree.new
    assert_equal 'Empty tree!', tree.maximum
  end

  def test_minimum_returns_the_data_of_the_smallest_element_in_the_tree
    tree = BinarySearchTree.new
    tree.insert('c').insert('b').insert('a')
    assert_equal 'a', tree.minimum
  end

  def test_minimum_doesnt_blow_up_when_the_tree_is_empty
    tree = BinarySearchTree.new
    assert_equal 'Empty tree!', tree.minimum
  end

  def test_delete_removes_the_node_with_the_desired_value_from_the_tree
    tree = BinarySearchTree.new
    tree.insert('d').insert('b').insert('f')
    tree.delete('f')
    assert_equal false, tree.include?('f')
    tree.delete('b')
    assert_equal false, tree.include?('b')
  end

  def test_delete_doesnt_blow_up_when_the_tree_is_empty
    tree = BinarySearchTree.new
    assert_equal 'That node doesnt exist!', tree.delete('a')
  end

  def test_sort_returns_a_sorted_array_of_the_node_data_in_the_tree
    tree = BinarySearchTree.new
    tree.insert('d').insert('b').insert('f')
    assert_equal ['b', 'd', 'f'], tree.sort
  end

  def test_sort_doesnt_blow_up_when_the_tree_is_empty
    tree = BinarySearchTree.new
    assert_equal 'Empty tree!', tree.sort
  end
end
