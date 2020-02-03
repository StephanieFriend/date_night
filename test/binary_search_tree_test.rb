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

    tree.insert(89, "Mowgli")
    tree.insert(56, "Frozen")
    tree.insert(91, "Moana")
    tree.insert(43, "Jungle Book")

    assert_equal true, tree.include?(56)
    assert_equal false, tree.include?(41)
  end

  def test_it_can_return_depth_of_rating
    tree = BinarySearchTree.new

    assert_equal nil, tree.depth_of(50)

    tree.insert(89, "Mowgli")
    tree.insert(56, "Frozen")
    tree.insert(91, "Moana")
    tree.insert(43, "Jungle Book")

    assert_equal 1, tree.depth_of(56)
    assert_equal 0, tree.depth_of(89)
  end

  def test_it_can_return_movie_with_highest_score
    tree = BinarySearchTree.new

    tree.insert(89, "Mowgli")
    tree.insert(56, "Frozen")
    tree.insert(91, "Moana")
    tree.insert(43, "Jungle Book")

    expected = {"Moana" => 91}

    assert_equal expected, tree.max
  end

  def test_it_can_return_movie_with_lowest_score
    tree = BinarySearchTree.new

    tree.insert(89, "Mowgli")
    tree.insert(56, "Frozen")
    tree.insert(91, "Moana")
    tree.insert(43, "Jungle Book")

    expected = {"Jungle Book" => 43}

    assert_equal expected, tree.min
  end

  def test_it_can_sort_by_rating
    tree = BinarySearchTree.new

    tree.insert(5, "Place 4")
    tree.insert(3, "Place 2")
    tree.insert(7, "Place 6")
    tree.insert(1, "Place 1")
    tree.insert(4, "Place 3")
    tree.insert(6, "Place 5")
    tree.insert(8, "Place 7")

    expected = [
        {"Place 1" => 1},
        {"Place 2" => 3},
        {"Place 3" => 4},
        {"Place 4" => 5},
        {"Place 5" => 6},
        {"Place 6" => 7},
        {"Place 7" => 8}
    ]

    assert_equal expected, tree.sort
  end

  def test_it_can_load_file
    tree = BinarySearchTree.new


    assert_equal 8, tree.load("lib/movies.txt")
  end

  def test_it_can_flatten
    tree = BinarySearchTree.new

    tree.insert(5, "Place 4")
    tree.insert(3, "Place 2")
    tree.insert(7, "Place 6")
    tree.insert(1, "Place 1")
    tree.insert(4, "Place 3")
    tree.insert(6, "Place 5")
    tree.insert(8, "Place 7")

    assert_equal [5, 3, 7, 1, 4, 6, 8], tree.flatten_tree
  end
end