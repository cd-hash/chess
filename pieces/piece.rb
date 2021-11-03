

class Piece
    attr_reader :position, :board, :color

    def initialize(position, board, color = 'white')# color is how we're going to track sides
        @position = position
        @board = board
        @color = color # white is the bottom of the board, black is the top
    end

    def symbol
    end

    def to_s
        symbol
    end

    def moves
        #this returns all viable moves for a piece
    end
end