require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable

    def symbol
        return "\u2658"
    end

    def move_diffs
        return knight_moves
    end
end