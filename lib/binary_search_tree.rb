require_relative 'node'
class BinarySearchTree

  attr_reader :root_node

  def initialize
    @root_node = nil
  end

  def insert(rating, title, root = @root_node, depth = 0)
    if @root_node == nil
      @root_node = Node.new(rating, title)
      return depth
    end

    if root.rating > rating
      if root.left_node == nil
        root.left_node = Node.new(rating, title)
        return depth + 1
      else
        return insert(rating, title, root.left_node, depth + 1)
      end
    else
      if root.right_node == nil
        root.right_node = Node.new(rating, title)
        return depth + 1
      else
        return insert(rating, title, root.right_node, depth + 1)
      end
    end
  end

  def include?(rating, node = @root_node)
    if node == nil
      return false
    end

    if rating == node.rating
      return true
    end

    if rating > node.rating
      return include?(rating, node.right_node)
    else
      return include?(rating, node.left_node)
    end
  end

  def depth_of(rating, node = @root_node, depth = 0)
    if node == nil
      return nil
    end

    if rating == node.rating
      return depth
    end

    if rating > node.rating
      return depth_of(rating, node.right_node, depth + 1)
    else
      return depth_of(rating, node.left_node, depth + 1)
    end
  end

  def max(node = @root_node)
    if node.right_node == nil
      return {node.title => node.rating}
    end

    return max(node.right_node)
  end

  def min(node = @root_node)
    if node.left_node == nil
      return {node.title => node.rating}
    end

    return min(node.left_node)
  end

  def sort(node = @root_node, sorted_list = [])
    if node.left_node != nil
      sort(node.left_node, sorted_list)
    end

    sorted_list << {node.title => node.rating}

    if node.right_node != nil
      sort(node.right_node, sorted_list)
    end

    return sorted_list
  end

  def load(file_name)
    File.foreach(file_name).inject(0) { |count, line| count + 1 }
  end

  def health
    #TODO: to implement
  end

  #bredth first traversal
  def flatten_tree(node = @root_node, rating_array = [])
    if node == nil
      return rating_array
    end

    if rating_array.empty?
      rating_array << node.rating
    end

    if node.left_node != nil
      rating_array << node.left_node.rating
    end

    if node.right_node != nil
      rating_array << node.right_node.rating
    end

    flatten_tree(node.left_node, rating_array)
    flatten_tree(node.right_node, rating_array)

    return rating_array
  end
end