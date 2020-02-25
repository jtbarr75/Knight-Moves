class Node
  attr_accessor :moves, :loc, :parent

  MOVES = [[2,1],[2,-1],[-2,1],[-2,1],[1,2],[-1,2],[1,-2],[-1,-2]]
  
  def initialize(loc)
    @loc = loc
    @moves = create_moves
  end

  #each node is initialized with all valid knight moves from their location
  def create_moves
    valid_moves = []
    MOVES.each do |move|
      location = [move[0] + loc[0], move[1] + loc[1]]
      valid_moves << location if location[0].between?(0,7) && location[1].between?(0,7)
    end
    valid_moves
  end
end