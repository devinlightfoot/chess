require_relative 'pieces'
module UC
    White_king ||= "♔"
    White_queen ||= "♕"
    White_rook ||= "♖"
    White_bishop ||= "♗"
    White_knight ||= "♘"
    White_pawn ||= "♙"
    Black_king ||= "♚"
    Black_queen ||= "♛"
    Black_rook ||= "♜"
    Black_bishop ||= "♝"
    Black_knight ||= "♞"
    Black_pawn ||= "♟"
    space = "\u0020"
    Space ||= space.encode('utf-8')
end
class Board
    include UC
    attr_accessor :board
    def initialize()
        @board = Array.new(8) { Array.new(8,Space) }
    end
    def display
        @board.each { |col|
          print "\n"
          @s = "+----+----+----+----+----+----+----+----+"
          puts @s
          col.each {|row|
            print "| #{row}  "
            } 
            print "|"}
            print "\n"
            print @s
      end
end
