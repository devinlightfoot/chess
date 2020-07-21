require_relative 'board'
require_relative 'pieces'
$turn = 1
class Rules
  include UC
  board = Board.new
  def game_setup
    

  end

  def check; end

  def checkmate; end
end
class Input
  def player_move; end
end
class Play
  def initialize
    rules = Rules.new
    input = Input.new
  end
end
play = Play.new
