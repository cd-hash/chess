

class Piece
    attr_reader :position, :board, :color

    def initialize(position, board, color)# color is how we're going to track sides
        @position = position
        @board = board
        @color = color # white is the bottom of the board, black is the top
    end

    def symbol
    end

    def to_s
        symbol
    end

    def valid_moves
        #this returns all viable moves for a piece
        return moves.select { |move| !move_into_check?(move) }
    end

    def move_into_check?(end_pos)
        duped_board = @board.dup
        duped_board.move_piece!(@position, end_pos)
        duped_board.in_check?(@color)
    end

    def moves
    end

    def update_postion(new_position)
        @position = new_position
    end
end