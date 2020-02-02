require 'minitest/autorun'
require 'minitest/pride'
require '../lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def test_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_it_can_insert_a_node
    tree = BinarySearchTree.new

    assert_equal 0, tree.insert(89, "Mowgli")

    assert_equal 1, tree.insert(56, "Frozen")

    assert_equal 1, tree.insert(91, "Moana")

    assert_equal 2, tree.insert(43, "Jungle Book")
  end

  def test_it_can_find_value
    tree = BinarySearchTree.new

    assert_equal false, tree.include?(50)

    assert_equal 0, tree.insert(89, "Mowgli")
    assert_equal 1, tree.insert(56, "Frozen")
    assert_equal 1, tree.insert(91, "Moana")
    assert_equal 2, tree.insert(43, "Jungle Book")

    assert_equal true, tree.include?(56)
    assert_equal false, tree.include?(41)
  end

  def test_it_can_return_depth_of_rating
    tree = BinarySearchTree.new

    assert_equal nil, tree.depth_of(50)

    assert_equal 0, tree.insert(89, "Mowgli")
    assert_equal 1, tree.insert(56, "Frozen")
    assert_equal 1, tree.insert(91, "Moana")
    assert_equal 2, tree.insert(43, "Jungle Book")

    assert_equal 1, tree.depth_of(56)
    assert_equal 0, tree.depth_of(89)
  end
end