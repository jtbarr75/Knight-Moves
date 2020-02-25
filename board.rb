class Board
  attr_accessor :board
  require_relative 'node.rb'

  def knight_moves(start_loc, end_loc)
    #create a pointer 'knight' to a node, nodes have children of all possible knight moves from their location
    knight = Node.new(start_loc)
    queue = []
    locations = []
    visited = []
    queue << knight
    #iterate through the possible moves, add subsequent moves to the queue, does not revisit locations
    #stops when knight pointer reaches the end location
    until knight.loc == end_loc
      knight = queue.shift
      visited << knight.loc

      knight.moves.each do |move|
        next if visited.include? move
        new_location = Node.new(move)
        new_location.parent = knight
        queue << new_location
      end
    end
    #goes back through parent nodes to store the path in locations array
    until knight.parent.nil?
      locations << knight.loc
      knight = knight.parent
    end

    locations << start_loc
    locations.reverse
  end
end

game = Board.new
# puts game.board.inspect
puts game.knight_moves([0,0],[7,3]).inspect