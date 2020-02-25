class Board
  attr_accessor :board
  require_relative 'node.rb'

  def knight_moves(start_loc, end_loc)
    puts "Invalid start or end point" unless (start_loc + end_loc).all? { |values| values.between?(0,7) }
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
    print_path locations.reverse
  end

  def print_path(locations)
    puts "You made it in #{locations.length} moves! Here is your path"
    locations.each { |loc| puts loc.inspect }
  end

  #creates methods for get_starting_pos and get_ending_pos that prompt user for input
  ["starting", "ending"].each do |name|
    define_method("get_#{name}_pos") do 
      puts "Enter #{name} position x, y where x and y are integers between 0-7"
      pos = gets.chomp
      until pos =~ /^[0-7], *[0-7]$/
        puts "Please only enter: x, y where x and y are integers between 0-7"
        pos = gets.chomp
      end
      pos.strip.split(",").map(&:to_i)
    end
  end
end

game = Board.new
start_pos = game.get_starting_pos
end_pos = game.get_ending_pos
game.knight_moves(start_pos,end_pos)