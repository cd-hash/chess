require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable

    def symbol
        return "\u2655"
    end

    def move_dirs
        return horizontal_dirs + diagonal_dirs
    end
end