class Board
  attr_accessor :board
  
  def initialize
    @board = create_board
  end

  def create_board
    board = Array.new(8) {Array.new(8)}
    0.upto(7) do |x|
      0.upto(7) do |y|
        board[x][y] = [x,y]
      end
    end
    board
  end
end

game = Board.new
puts game.board.inspect