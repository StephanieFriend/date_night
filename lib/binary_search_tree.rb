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
    if rating == node
      return true
    end

    if rating > node.rating
      return node.right_node == nil ? false : include?(rating, node.right_node)
      # if node.right_node == nil
      #   return false
      # else
      #   return include?(rating, node.right_node)
      # end
    else
      return node.left_node == nil ? false : include?(rating, node.left_node)
      # if node.left_node == nil
      #   return false
      # else
      #   return include?(rating, node.left_node)
      # end
    end
  end

  def depth_of
    #TODO: to implement
  end

  def max
    #TODO: to implement
  end

  def min
    #TODO: to implement
  end

  def sort
    #TODO: to implement
  end

  def load
    #TODO: to implement
  end

  def health
    #TODO: to implement
  end
end