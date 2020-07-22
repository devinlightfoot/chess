require_relative 'board'
require_relative 'pieces'
$turn = 1
$opponent = nil
$last  = nil
$check_count = 0
class Rules
  include UC
  attr_accessor :b, :board
  def initialize()
    @b = Board.new
    @board = @b.board
    @b.display
  end
  def set_opponent()
    puts "Choose your opponent: human or computer"
    input = gets.chomp.downcase
    $opponent = input.eql?("human") ? "human" : "computer"
  end
  def player_move()
    puts "Choose the piece you would like to move"
    input = gets.chomp.split(//)
    if !$turn.even? && @board[input[0]][input[1]].piece.color == "black"
        puts "Invalid Move"
        player_move()
    elsif $turn.even? && @board[input[0]][input[1]].piece.color == "white"
        puts "Invalid Move"
        player_move()
    else
      puts "Where would you like to move your piece?"
      output = gets.chomp.split(//)
      @board[input[0]][input[1]].piece.move(output)
      if @board[output[0]][output[1]].piece.nil? || @board[output[0]][output[1]].piece.color != @board[input[0]][input[1]].piece.color
        @board[input[0]][input[1]].piece.move(output)
        if @board[input[0]][input[1]].piece.pos == outpu
          @board[output[0]][output[1]].piece = @board[input[0]][input[1]].piece
          $last = @board[output[0]][output[1]].piece
          @board[input[0]][input[1]].piece = nil
        else
          puts "Invalid Move"
          player_move()
        end
      else
          puts "Invalid Move"
          player_move()
      end
    end
  end

  def check
    check_arr = $last.valid_moves
    check_arr.each do |sq|
        if @board[sq[0]][sq[1]].piece.instance_of?(King)
            $check_count += 1
            puts "Check"
        else
            $check_count = 0
        end
    end
  end

  def checkmate
    if $check_count >= 2
        true
    else
        false
    end
  end
end
class Play
  def initialize
    rules = Rules.new
    #r.set_opponent
    unless rules.checkmate
        if !$turn.even?
            puts "White's move:\n"
            rules.player_move
        else
            puts "Black's move:\n"
            rules.player_move
        end
        rules.b.display
        rules.check
        $turn += 1
    end
  end
end
play = Play.new
