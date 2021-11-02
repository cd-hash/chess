require_relative 'piece'
require_relative 'stepable'

class King < Piece
    include Stepable

    def symbol
        return "\u2654"
    end

    def move_diffs
        return king_moves
    end
end