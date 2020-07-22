require_relative 'board'
require_relative 'pieces'
$turn = 1
$last = nil
$check_count = 0
class Rules
  include UC
  attr_accessor :b, :board
  def initialize
    @b = Board.new
    @board = @b.board
    @b.display
  end

  def player_move
    puts 'Choose the piece you would like to move'
    input = gets.chomp.split(//)
    input.map!(&:to_i)
    if @board[input[0]][input[1]].piece.nil?
      puts 'Not a piece'
      player_move
    else
      if !$turn.even? && @board[input[0]][input[1]].piece.color == 'black'
        puts 'Invalid Move'
        player_move
      elsif $turn.even? && @board[input[0]][input[1]].piece.color == 'white'
        puts 'Invalid Move'
        player_move
      else
        puts 'Where would you like to move your piece?'
        puts @board[input[0]][input[1]].piece.valid_moves
        output = gets.chomp.split(//)
        output.map!(&:to_i)
        row = input[0]
        col = input[1]
        shift = 1
        shift_row = output[0] > input[0] ? 1 : -1
        shift_col = output[1] > input[1] ? 1 : -1
        diff = []
        until row == output[0] && col == output[1]
          if (row < output[0] || row > output[0]) && (col < output[1] || col > output[1])
            diff << [row + (shift*shift_row), col + (shift*shift_col)]
            row = row + (shift*shift_row)
            col = col + (shift*shift_col)
          elsif (row < output[0] || row > output[0]) && col == output[1]
            diff << [row + (shift*shift_row), col]
            row = row + (shift*shift_row)
          elsif row == output[0] && (col < output[1] || col > output[1])
            diff << [row, col + (shift*shift_col)]
            col = col + (shift*shift_col)
          end
        end
        blocked = false
        diff.each do |val|
          if !@board[val[0]][val[1]].piece.nil?
            blocked = true
            break
          else
            blocked = false
          end
        end
        if !blocked
          @board[input[0]][input[1]].piece.move(output)
          if @board[output[0]][output[1]].piece.nil? || @board[output[0]][output[1]].piece.color != @board[input[0]][input[1]].piece.color
            @board[input[0]][input[1]].piece.move(output)
            if @board[input[0]][input[1]].piece.pos == output
              @board[output[0]][output[1]].piece = @board[input[0]][input[1]].piece
              $last = @board[output[0]][output[1]].piece
              @board[input[0]][input[1]].piece = nil
            else
              puts 'Invalid Move'
              player_move
            end
          else
            puts 'Invalid Move'
            player_move
          end
        else
          puts "Invalid Move"
          player_move
        end
      end
    end
  end

  def check
    check_arr = $last.valid_moves
    check_arr.each do |sq|
      if @board[sq[0]][sq[1]].piece.instance_of?(King) && @board[sq[0]][sq[1]].piece.color != $last.color
        $check_count += 1
        puts 'Check'
      else
        $check_count = 0
      end
    end
  end

  def checkmate
    $check_count >= 2
  end
  def save()
    game_data = {"turn" => $turn, "last" => $last, "check_count" => $check_count, "board" => @board, "b" => @b}
    File.open(FNAME, 'wb') {|f| f.write(Marshal.dump(game_data))}
  end

  def load()
    load_game = Marshal.load(File.binread(FNAME))
    $turn = load_game["turn"]
    $last = load_game["last"]
    $check_count = load_game["check_count"]
    @board = load_game["board"]
    @b = load_game["b"]
  end
end
class Play
  def initialize
    rules = Rules.new
    until rules.checkmate
      puts 'Would you like to save or load?'
      input = gets.chomp.downcase
      if input.eql?('save')
        rules.save
      elsif input.eql?('load')
        rules.load
      end
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
