require_relative 'board'
class Pawn
    attr_reader :color
    attr_accessor :row, :col
    def initialize(color, row, col)
        @color = color
    end
    def move()

    end
end

class Rook
    attr_reader :color
    attr_accessor :row, :col
    def initialize(color, row, col)
        @color = color
    end
    def move()

    end
end

class Bishop
    attr_reader :color
    attr_accessor :row, :col
    def initialize(color, row, col)
        @color = color
    end
    def move()

    end
end

class Knight
    attr_reader :color
    attr_accessor :row, :col
    def initialize(color, row, col)
        @color = color
    end
    def move()

    end
end

class Queen
    attr_reader :color
    attr_accessor :row, :col
    def initialize(color, row, col)
        @color = color
    end
    def move()

    end
end

class King
    attr_reader :color
    attr_accessor :row, :col
    def initialize(color, row, col)
        @color = color
    end
    def move()

    end
end