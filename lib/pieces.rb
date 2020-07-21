require_relative 'board'
class Pawn
    attr_reader :color
    attr_accessor :pos, :row, :col
    def initialize(color,pos)
        @pos = pos
        @col = pos[0]
        @row = pos[1]
        @color = color
        @moved = false
    end
    def move(new_pos)
        if @moved == false && new_pos[1] == (@row + 2)
            @pos = new_pos
        elsif new_pos[1] = (@row + 1)
            @pos = new_pos
        else
            puts "Invalid move"
        end
    end
end

class Rook
    attr_reader :color
    attr_accessor :pos, :row, :col
    def initialize(color,pos)
        @pos = pos
        @col = pos[0]
        @row = pos[1]
        @color = color
    end
    def move(new_pos)

    end
end

class Bishop
    attr_reader :color
    attr_accessor :pos, :row, :col
    def initialize(color,pos)
        @pos = pos
        @col = pos[0]
        @row = pos[1]
        @color = color
    end
    def move(new_pos)

    end
end

class Knight
    attr_reader :color
    attr_accessor :pos, :row, :col
    def initialize(color,pos)
        @pos = pos
        @col = pos[0]
        @row = pos[1]
        @color = color
    end
    def move(new_pos)

    end
end

class Queen
    attr_reader :color
    attr_accessor :pos, :row, :col
    def initialize(color,pos)
        @pos = pos
        @col = pos[0]
        @row = pos[1]
        @color = color
    end
    def move(new_pos)

    end
end

class King
    attr_reader :color
    attr_accessor :pos, :row, :col
    def initialize(color,pos)
        @pos = pos
        @col = pos[0]
        @row = pos[1]
        @color = color
    end
    def move(new_pos)

    end
end