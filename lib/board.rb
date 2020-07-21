require_relative 'pieces'
module UC
    white_king = "♔"
    white_queen = "♕"
    white_rook = "♖"
    white_bishop = "♗"
    white_knight = "♘"
    white_pawn = "♙"
    black_king = "♚"
    black_queen = "♛"
    black_rook = "♜"
    black_bishop = "♝"
    black_knight = "♞"
    black_pawn = "♟"
end
class Square
    attr_accessor :row, :col, :piece
    def initialize(row, col, piece = nil)
        @row = row
        @col = col
        @piece = piece
    end
end
class Board
    include UC
    attr_accessor :board
    def initialize()
        @board = Array.new(8) { Array.new(8, " ") }
    end
    def display()
        @board.each { |i|
          print "\n"
          @a = "+----+----+----+----+----+----+----+----+"
          puts @a
          i.each {|n|
            print "| #{n}  "
            } 
            print "|"}
            print "\n"
            print @a
    end 
end
b = Board.new
b.display