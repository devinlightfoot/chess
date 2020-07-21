require_relative 'board'
require_relative 'pieces'
$turn = 1
class Rules
    include UC
    board = Board.new
    def game_setup

    end
    def check

    end
    def checkmate

    end
end
class Input

end
class Play
    def initialize()
        rules = Rules.new
    end
end
r = Rules.new
r.game_setup