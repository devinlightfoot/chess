require_relative 'unicode'
class Pawn
    include UC
    attr_reader :color
    attr_accessor :pos, :row, :col, :symbol
    def initialize(color,pos)
        @pos = pos
        @row = pos[0]
        @col = pos[1]
        @color = color
        @moved = false
        @symbol = nil
        if @color == "white"
            @symbol = White_pawn
        else
            @symbol = Black_pawn
        end
    end
    def valid_moves

    end
end

class Rook
    include UC
    attr_reader :color
    attr_accessor :pos, :row, :col, :symbol
    def initialize(color,pos)
        @pos = pos
        @row = pos[0]
        @col = pos[1]
        @color = color
        @symbol = nil
        if @color == "white"
            @symbol = White_rook
        else
            @symbol = Black_rook
        end
    end
    
end

class Bishop
    include UC
    attr_reader :color
    attr_accessor :pos, :row, :col, :symbol
    def initialize(color,pos)
        @pos = pos
        @row = pos[0]
        @col = pos[1]
        @color = color
        @symbol = nil
        if @color == "white"
            @symbol = White_bishop
        else
            @symbol = Black_bishop
        end
    end
    
end

class Knight
    include UC
    attr_reader :color
    attr_accessor :pos, :row, :col, :symbol
    def initialize(color,pos)
        @pos = pos
        @row = pos[0]
        @col = pos[1]
        @color = color
        @symbol = nil
        if @color == "white"
            @symbol = White_knight
        else
            @symbol = Black_knight
        end
    end
   
end

class Queen
    include UC
    attr_reader :color
    attr_accessor :pos, :row, :col, :symbol
    def initialize(color,pos)
        @pos = pos
        @row = pos[0]
        @col = pos[1]
        @color = color
        @symbol = nil
        if @color == "white"
            @symbol = White_queen
        else
            @symbol = Black_queen
        end
    end
    
end

class King
    include UC
    attr_reader :color
    attr_accessor :pos, :row, :col, :symbol
    def initialize(color,pos)
        @pos = pos
        @col = pos[0]
        @row = pos[1]
        @color = color
        @symbol = nil
        if @color == "white"
            @symbol = White_king
        else
            @symbol = Black_king
        end
    end
    
end