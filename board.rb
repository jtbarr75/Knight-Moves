class Board
  attr_accessor :board, :knight
  require_relative 'node.rb'
  def initialize
    @board = create_board
    @knight = Node.new([0,0])
  end

  def create_board
    new_board = Array.new(8) {Array.new(8)}
    0.upto(7) do |x|
      0.upto(7) do |y|
        new_board[x][y] = [x,y]
      end
    end
    new_board
  end

  def knight_moves(start_loc, end_loc)
    knight = Node.new(start_loc)
    
    queue = []
    locations = []
    visited = []
    queue << knight
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