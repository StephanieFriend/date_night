class Node

  attr_reader :rating, :title
  attr_accessor :left_node, :right_node

  def initialize(rating, title)
    @rating = rating
    @title = title
  end


end