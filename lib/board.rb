#require_relative 'pieces'
module UC
  White_king ||= '♔'.freeze
  White_queen ||= '♕'.freeze
  White_rook ||= '♖'.freeze
  White_bishop ||= '♗'.freeze
  White_knight ||= '♘'.freeze
  White_pawn ||= '♙'.freeze
  Black_king ||= '♚'.freeze
  Black_queen ||= '♛'.freeze
  Black_rook ||= '♜'.freeze
  Black_bishop ||= '♝'.freeze
  Black_knight ||= '♞'.freeze
  Black_pawn ||= '♟'.freeze
  space = "\u0020"
  Space ||= space.encode('utf-8')
end

class Square
    include UC
    attr_accessor :pos, :piece, :symbol
    def initialize(pos, piece = nil)
        @pos = pos
        @row = pos[0]
        @col = pos[1]
        @piece = piece
        @symbol = Space
    end
    def print_sq
        @piece.nil? ? @symbol = Space : @symbol = @piece.symbol
        return @symbol
    end
end

class Board
  include UC
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8, Space) }
    @board.each_with_index do |row, ir|
        row.each_with_index do |col, ic|
            @board[ir][ic] = Square.new([ir, ic])
        end
    end
  end

  def display
    @board.each do |col|
      print "\n"
      @s = '+----+----+----+----+----+----+----+----+'
      puts @s
      col.each do |row|
        print "| #{row.print_sq}  "
      end
      print '|'
    end
    print "\n"
    print @s
    end
end
b = Board.new
b.display