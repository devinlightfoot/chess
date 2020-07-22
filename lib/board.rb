require_relative 'pieces'
require_relative 'unicode'
class Square
  include UC
  attr_accessor :pos, :piece, :symbol
  def initialize(pos, piece = nil)
    @pos = pos
    @row = pos[0]
    @col = pos[1]
    @piece = piece
    @symbol = SPACE
  end

  def print_sq
    @symbol = @piece.nil? ? SPACE : @piece.symbol
    @symbol
  end
end

class Board
  include UC
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8, SPACE) }
    @board.each_with_index do |row, ir|
      row.each_with_index do |_col, ic|
        @board[ir][ic] = if ir == 0 && (ic == 0 || ic == 7)
                           Square.new([ir, ic], Rook.new('white', [ir, ic]))
                         elsif ir == 0 && (ic == 1 || ic == 6)
                           Square.new([ir, ic], Knight.new('white', [ir, ic]))
                         elsif ir == 0 && (ic == 2 || ic == 5)
                           Square.new([ir, ic], Bishop.new('white', [ir, ic]))
                         elsif ir == 0 && ic == 3
                           Square.new([ir, ic], Queen.new('white', [ir, ic]))
                         elsif ir == 0 && ic == 4
                           Square.new([ir, ic], King.new('white', [ir, ic]))
                         elsif ir == 1
                           Square.new([ir, ic], Pawn.new('white', [ir, ic]))
                         elsif ir == 6
                           Square.new([ir, ic], Pawn.new('black', [ir, ic]))
                         elsif ir == 7 && (ic == 0 || ic == 7)
                           Square.new([ir, ic], Rook.new('black', [ir, ic]))
                         elsif ir == 7 && (ic == 1 || ic == 6)
                           Square.new([ir, ic], Knight.new('black', [ir, ic]))
                         elsif ir == 7 && (ic == 2 || ic == 5)
                           Square.new([ir, ic], Bishop.new('black', [ir, ic]))
                         elsif ir == 7 && ic == 3
                           Square.new([ir, ic], King.new('black', [ir, ic]))
                         elsif ir == 7 && ic == 4
                           Square.new([ir, ic], Queen.new('black', [ir, ic]))
                         else
                           Square.new([ir, ic])
                         end
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

