require_relative 'unicode'
#require_relative 'board'
class Pawn
  include UC
  attr_reader :color
  attr_accessor :pos, :row, :col, :symbol
  def initialize(color, pos)
    @pos = pos
    @row = pos[0]
    @col = pos[1]
    @color = color
    @moved = false
    @symbol = nil
    @symbol = if @color == 'white'
                White_pawn
              else
                Black_pawn
              end
  end
  def valid_moves()
    arr = []
    if @moved && @color == "white"
        arr << [@row + 2. @col]
    elsif @moved && @color == "black"
        arr << [@row - 2, @col]
    else
        if @color == "white"
            if @row + 1 <= 7
              arr << [@row + 1, @col]
            else
                puts "Invalid Move"
            end
        else
            if @row - 1 >= 0
              arr << [@row - 1, @col]
            else
                puts "Invalid Move"
            end
        end
    end
    arr
  end
  def move(new_pos)
    moves = valid_moves()
    if moves.include?(new_pos)
        @pos = new_pos
    else
        puts "Invalid Move"
    end
  end
end

class Rook
  include UC
  attr_reader :color
  attr_accessor :pos, :row, :col, :symbol
  def initialize(color, pos)
    @pos = pos
    @row = pos[0]
    @col = pos[1]
    @color = color
    @symbol = nil
    @symbol = if @color == 'white'
                White_rook
              else
                Black_rook
              end
  end
  def valid_moves()
    arr = []
    shift = 1
    while ((shift + @row) <= 7) || ((@row - shift) >= 0) || ((shift + @col) <= 7) || ((@col - shift) >= 0)
        if (shift + @row) <= 7
          arr << [@row + shift, @col]
        elsif (@row - shift) >= 0
            arr << [@row - shift, @col]
        elsif (shift + @col) <= 7
            arr << [@row, @col + shift]
        elsif (@col - shift) >= 0
            arr << [@row, @col - shift]
        end
        shift += 1
    end
    arr
  end
  def move(new_pos)
    moves = valid_moves()
    if moves.include?(new_pos)
        @pos = new_pos
    else
        puts "Invalid Move"
    end
  end
end

class Bishop
  include UC
  attr_reader :color
  attr_accessor :pos, :row, :col, :symbol
  def initialize(color, pos)
    @pos = pos
    @row = pos[0]
    @col = pos[1]
    @color = color
    @symbol = nil
    @symbol = if @color == 'white'
                White_bishop
              else
                Black_bishop
              end
  end
  def valid_moves()
    arr = []
    shift = 1
    while @row + shift <= 7 || @row - shift >= 0 || @col + shift <= 7 || @col - shift >= 0
        if @row + shift <= 7 && @col + shift <= 7
            arr << [@row + shift, @col + shift]
        elsif @row + shift <= 7 && @col - shift >= 0
            arr << [@row + shift, @col - shift]
        elsif @row - shift >= 0 && @col + shift <= 7
            arr << [@row -shift, @col + shift]
        elsif @row - shift >= 0 && @col - shift >= 0
            arr << [@row - shift, @col - shift]
        end
        shift += 1
    end
    arr
  end
  def move(new_pos)
    moves = valid_moves()
    if moves.include?(new_pos)
        @pos = new_pos
    else
        puts "Invalid Move"
    end
  end
end

class Knight
  include UC
  attr_reader :color
  attr_accessor :pos, :row, :col, :symbol
  def initialize(color, pos)
    @pos = pos
    @row = pos[0]
    @col = pos[1]
    @color = color
    @symbol = nil
    @symbol = if @color == 'white'
                White_knight
              else
                Black_knight
              end
  end
  def valid_moves()
    arr = []
    if @row + 2 <= 7 && @col + 1 <= 7
        arr << [@row + 2, @col + 1]
    elsif @row +2 <= 7 && @col - 1 >= 0
        arr << [@row + 2, @col - 1]
    elsif @row - 2 >= 0 && @col + 1 <= 7
        arr << [@row -2, @col + 1]
    elsif @row - 2 >= 0 && @col - 1 >= 0
        arr << [@row - 2, @col - 1]
    elsif @row + 1 <= 7 && @col + 2 <= 7
        arr << [@row + 1, @col + 2]
    elsif @row + 1 <= 7 && @col - 2 >= 0
        arr << [@row + 1, @col - 2]
    elsif @row - 1 >= 0 && @col + 2 <= 7
        arr << [@row - 1, @col + 2]
    elsif @row - 1 >= 0 && @col - 2 >= 0
        arr << [@row - 1, @col - 2]
    end
    arr
  end
  def move(new_pos)
    moves = valid_moves()
    if moves.include?(new_pos)
        @pos = new_pos
    else
        puts "Invalid Move"
    end
  end
end

class Queen
  include UC
  attr_reader :color
  attr_accessor :pos, :row, :col, :symbol
  def initialize(color, pos)
    @pos = pos
    @row = pos[0]
    @col = pos[1]
    @color = color
    @symbol = nil
    @symbol = if @color == 'white'
                White_queen
              else
                Black_queen
              end
  end
  def valid_moves()
    arr = []
    shift = 1
    while ((shift + @row) <= 7) || ((@row - shift) >= 0) || ((shift + @col) <= 7) || ((@col - shift) >= 0)
        if (shift + @row) <= 7
          arr << [@row + shift, @col]
        elsif (@row - shift) >= 0
            arr << [@row - shift, @col]
        elsif (shift + @col) <= 7
            arr << [@row, @col + shift]
        elsif (@col - shift) >= 0
            arr << [@row, @col - shift]
        elsif @row + shift <= 7 && @col + shift <= 7
            arr << [@row + shift, @col + shift]
        elsif @row + shift <= 7 && @col - shift >= 0
            arr << [@row + shift, @col - shift]
        elsif @row - shift >= 0 && @col + shift <= 7
            arr << [@row -shift, @col + shift]
        elsif @row - shift >= 0 && @col - shift >= 0
            arr << [@row - shift, @col - shift]
        end
        shift += 1
    end
    arr
  end
  def move(new_pos)
    moves = valid_moves()
    if moves.include?(new_pos)
        @pos = new_pos
    else
        puts "Invalid Move"
    end
  end
end

class King
  include UC
  attr_reader :color
  attr_accessor :pos, :row, :col, :symbol
  def initialize(color, pos)
    @pos = pos
    @col = pos[0]
    @row = pos[1]
    @color = color
    @symbol = nil
    @symbol = if @color == 'white'
                White_king
              else
                Black_king
              end
  end
  def valid_move()
    arr = []
    if @row + 1 <= 7
        arr << [@row + 1, @col]
    elsif @row - 1 >= 0
        arr << [@row - 1, @col]
    elsif @col + 1 <= 7
        arr << [@row, @col + 1]
    elsif @col - 1 >= 0
        arr << [@row, @col - 1]
    elsif @row + 1 <= 7 && @col + 1 <= 7
        arr << [@row + 1, @col + 1]
    elsif @row + 1 <= 7 && @col - 1 >= 0
        arr << [@row + 1, @col - 1]
    elsif @row - 1 >= 0 && @col + 1 <= 7
        arr << [@row - 1, @col + 1]
    elsif @row - 1 >= 0 && @col - 1 >= 0
        arr << [@row - 1, @col - 1]
    end
    arr
  end
  def move(new_pos)
    moves = valid_moves()
    if moves.include?(new_pos)
        @pos = new_pos
    else
        puts "Invalid Move"
    end
  end
end
